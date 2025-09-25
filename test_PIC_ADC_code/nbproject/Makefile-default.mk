#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=maxfi052_lab6_cirBuffer_v001.c maxfi052_lab6_main_v001.c maxfi052_lab6_lcdDisplay_v001.c maxfi052_lab6_asmLib_v001.s maxfi052_lab6_adc_v001.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o ${OBJECTDIR}/maxfi052_lab6_main_v001.o ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o ${OBJECTDIR}/maxfi052_lab6_adc_v001.o
POSSIBLE_DEPFILES=${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o.d ${OBJECTDIR}/maxfi052_lab6_main_v001.o.d ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o.d ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o.d ${OBJECTDIR}/maxfi052_lab6_adc_v001.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o ${OBJECTDIR}/maxfi052_lab6_main_v001.o ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o ${OBJECTDIR}/maxfi052_lab6_adc_v001.o

# Source Files
SOURCEFILES=maxfi052_lab6_cirBuffer_v001.c maxfi052_lab6_main_v001.c maxfi052_lab6_lcdDisplay_v001.c maxfi052_lab6_asmLib_v001.s maxfi052_lab6_adc_v001.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o: maxfi052_lab6_cirBuffer_v001.c  .generated_files/flags/default/c9a797620dee341e5669a897941180b5f347ac54 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_cirBuffer_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/maxfi052_lab6_main_v001.o: maxfi052_lab6_main_v001.c  .generated_files/flags/default/b0bff6293c7820cbe0b18ae81f3b99ae1b58f276 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_main_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_main_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_main_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_main_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_main_v001.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o: maxfi052_lab6_lcdDisplay_v001.c  .generated_files/flags/default/d52e8d3c0537bc21fb10facfca87c900999d0b02 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_lcdDisplay_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/maxfi052_lab6_adc_v001.o: maxfi052_lab6_adc_v001.c  .generated_files/flags/default/d76d4d535855fc01cb9acf1158d29bcf3b6efa6b .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_adc_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_adc_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_adc_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_adc_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_adc_v001.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o: maxfi052_lab6_cirBuffer_v001.c  .generated_files/flags/default/e0b7fe638be022be722d3d3e1025b3f3563184a1 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_cirBuffer_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_cirBuffer_v001.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/maxfi052_lab6_main_v001.o: maxfi052_lab6_main_v001.c  .generated_files/flags/default/5476d8910e3ac560022a3f3e386e403f63f161ba .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_main_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_main_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_main_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_main_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_main_v001.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o: maxfi052_lab6_lcdDisplay_v001.c  .generated_files/flags/default/be77d160b58e538b01b86d8d6f033f87efaead75 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_lcdDisplay_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_lcdDisplay_v001.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/maxfi052_lab6_adc_v001.o: maxfi052_lab6_adc_v001.c  .generated_files/flags/default/ddce36f13ab0c7d85d7620d83d431d0d8d2fb9db .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_adc_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_adc_v001.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  maxfi052_lab6_adc_v001.c  -o ${OBJECTDIR}/maxfi052_lab6_adc_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/maxfi052_lab6_adc_v001.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o: maxfi052_lab6_asmLib_v001.s  .generated_files/flags/default/2d69170509edb1d092f0f38073ebdab2969b2401 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  maxfi052_lab6_asmLib_v001.s  -o ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o: maxfi052_lab6_asmLib_v001.s  .generated_files/flags/default/eaae452e54f7619a9400b4c1bd99063ca9ba4316 .generated_files/flags/default/50f7a042aaef99cb4897485965b8790d673a2493
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  maxfi052_lab6_asmLib_v001.s  -o ${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/maxfi052_lab6_asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/maxfi052_lab6_v001.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
