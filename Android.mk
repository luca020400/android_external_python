LOCAL_PATH := $(call my-dir)

PYTHON_VERSION := 3.6
PYTHON_SRC_DIR := $(LOCAL_PATH)

include $(CLEAR_VARS)

MODULE_SRC := \
	Modules/config.c \
	Modules/getpath.c \
	Modules/main.c \
	Modules/gcmodule.c \
	Modules/_io/_iomodule.c \
	Modules/_io/iobase.c \
	Modules/_io/fileio.c \
	Modules/_io/bufferedio.c \
	Modules/_io/textio.c \
	Modules/_io/bytesio.c \
	Modules/_io/stringio.c

MODULE_SRC += \
	Modules/atexitmodule.c \
	Modules/_codecsmodule.c \
	Modules/_collectionsmodule.c \
	Modules/errnomodule.c \
	Modules/faulthandler.c \
	Modules/_functoolsmodule.c \
	Modules/hashtable.c \
	Modules/itertoolsmodule.c \
	Modules/_localemodule.c \
	Modules/_math.c \
	Modules/_operator.c \
	Modules/posixmodule.c \
	Modules/pwdmodule.c \
	Modules/signalmodule.c \
	Modules/_sre.c \
	Modules/_stat.c \
	Modules/symtablemodule.c \
	Modules/_threadmodule.c \
	Modules/timemodule.c \
	Modules/_tracemalloc.c \
	Modules/_weakref.c \
	Modules/xxsubtype.c \
	Modules/zipimport.c \

PARSER_SRC := \
	Parser/acceler.c \
	Parser/bitset.c \
	Parser/firstsets.c \
	Parser/grammar1.c \
	Parser/grammar.c \
	Parser/listnode.c \
	Parser/metagrammar.c \
	Parser/myreadline.c \
	Parser/node.c \
	Parser/parser.c \
	Parser/parsetok.c \
	Parser/pgen.c \
	Parser/printgrammar.c \
	Parser/tokenizer.c

PYTHON_SRC := \
	Python/asdl.c \
	Python/ast.c \
	Python/bltinmodule.c \
	Python/ceval.c \
	Python/codecs.c \
	Python/compile.c \
	Python/dtoa.c \
	Python/dynamic_annotations.c \
	Python/errors.c \
	Python/fileutils.c \
	Python/formatter_unicode.c \
	Python/frozen.c \
	Python/frozenmain.c \
	Python/future.c \
	Python/getargs.c \
	Python/getcompiler.c \
	Python/getcopyright.c \
	Python/getopt.c \
	Python/getplatform.c \
	Python/getversion.c \
	Python/graminit.c \
	Python/import.c \
	Python/importdl.c \
	Python/marshal.c \
	Python/modsupport.c \
	Python/mysnprintf.c \
	Python/mystrtoul.c \
	Python/peephole.c \
	Python/pyarena.c \
	Python/pyctype.c \
	Python/pyfpe.c \
	Python/pyhash.c \
	Python/pylifecycle.c \
	Python/pymath.c \
	Python/pystate.c \
	Python/pystrcmp.c \
	Python/pystrhex.c \
	Python/pystrtod.c \
	Python/Python-ast.c \
	Python/pythonrun.c \
	Python/pytime.c \
	Python/random.c \
	Python/structmember.c \
	Python/symtable.c \
	Python/sysmodule.c \
	Python/thread.c \
	Python/traceback.c \
	Python/_warnings.c

OBJECT_SRC := \
	Objects/abstract.c \
	Objects/accu.c \
	Objects/boolobject.c \
	Objects/bytearrayobject.c \
	Objects/bytes_methods.c \
	Objects/bytesobject.c \
	Objects/capsule.c \
	Objects/cellobject.c \
	Objects/classobject.c \
	Objects/codeobject.c \
	Objects/complexobject.c \
	Objects/descrobject.c \
	Objects/dictobject.c \
	Objects/enumobject.c \
	Objects/exceptions.c \
	Objects/fileobject.c \
	Objects/floatobject.c \
	Objects/frameobject.c \
	Objects/funcobject.c \
	Objects/genobject.c \
	Objects/iterobject.c \
	Objects/listobject.c \
	Objects/longobject.c \
	Objects/memoryobject.c \
	Objects/methodobject.c \
	Objects/moduleobject.c \
	Objects/namespaceobject.c \
	Objects/object.c \
	Objects/obmalloc.c \
	Objects/odictobject.c \
	Objects/rangeobject.c \
	Objects/setobject.c \
	Objects/sliceobject.c \
	Objects/structseq.c \
	Objects/tupleobject.c \
	Objects/typeobject.c \
	Objects/unicodectype.c \
	Objects/unicodeobject.c \
	Objects/weakrefobject.c

DYNLOAD_SRC := \
	Python/dynload_stub.c

LIBRARY_SRC := \
	Modules/getbuildinfo.c \
	$(PARSER_SRC) \
	$(OBJECT_SRC) \
	$(PYTHON_SRC) \
	$(MODULE_SRC) \
	$(DYNLOAD_SRC)

LOCAL_C_INCLUDES += \
	$(PYTHON_SRC_DIR) \
	$(PYTHON_SRC_DIR)/Include

LOCAL_CFLAGS += \
	-Wno-date-time \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers

LOCAL_CFLAGS += -DPy_BUILD_CORE

LOCAL_CFLAGS += \
	-DSOABI='""' \
	-DPREFIX='"/system/usr"' \
	-DEXEC_PREFIX='"/system/usr"' \
	-DVERSION='"3.6"' \
	-DVPATH='""' \
	-DPYTHONPATH='":"' \

PROGRAM_SRC := Programs/python.c

LOCAL_SRC_FILES := $(LIBRARY_SRC) $(PROGRAM_SRC)

LOCAL_MODULE := python$(PYTHON_VERSION)

include $(BUILD_EXECUTABLE)
