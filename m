Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0DB1839A9
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 20:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgCLTj1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 15:39:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:47460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgCLTj1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 15:39:27 -0400
Received: from localhost (mobile-166-175-186-165.mycingular.net [166.175.186.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46372206E2;
        Thu, 12 Mar 2020 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584041961;
        bh=5eAyMrkDKXgCRXwDkpJJO3Rg843utLywrhCfREdaJfw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=DmhxpkbPUOMzNnwepEm3yo5TMwlU7qlxsItU54FfDmvuFdnRTtohWf1H5C8cBsxuE
         WxGo2iYWdyA50qLbtgsikhKJHyEqaYy+Yhh2bPb+V/JqlCczom5JdE7y8LKeQnXfzv
         hwKsAO/amENEmKwPbI3HyiWGh6qSc8gViszYqTGI=
Date:   Thu, 12 Mar 2020 14:39:17 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Subject: Re: linux-next: Tree for Mar 12 (pci/controller/mobiveil/)
Message-ID: <20200312193917.GA160316@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c0db5d0-1a61-cb80-2bcb-034f5bcd1597@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 12, 2020 at 08:13:50AM -0700, Randy Dunlap wrote:
> On 3/12/20 3:04 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200311:
> > 
> 
> on i386:
> # CONFIG_PCI_MSI is not set
> 
> WARNING: unmet direct dependencies detected for PCIE_MOBIVEIL_HOST
>   Depends on [n]: PCI [=y] && PCI_MSI_IRQ_DOMAIN [=n]
>   Selected by [y]:
>   - PCIE_MOBIVEIL_PLAT [=y] && PCI [=y] && (ARCH_ZYNQMP || COMPILE_TEST [=y]) && OF [=y]

Thanks, Randy.

I'm not sure if this is a new problem introduced by something in my
"next" branch, or if this is an existing problem we just happened to
hit with randconfig.

Here are the commits on remotes/lorenzo/pci/mobiveil branch:

  d29ad70a813b ("PCI: mobiveil: Add PCIe Gen4 RC driver for Layerscape SoCs")
  3edeb49525bb ("dt-bindings: PCI: Add NXP Layerscape SoCs PCIe Gen4 controller")
  11d22cc395ca ("PCI: mobiveil: Add Header Type field check")
  029dea3cdc67 ("PCI: mobiveil: Add 8-bit and 16-bit CSR register accessors")
  52cae4c7082f ("PCI: mobiveil: Allow mobiveil_host_init() to be used to re-init host")
  fc99b3311af7 ("PCI: mobiveil: Add callback function for link up check")
  ed620e96541f ("PCI: mobiveil: Add callback function for interrupt initialization")
  03bdc3884019 ("PCI: mobiveil: Modularize the Mobiveil PCIe Host Bridge IP driver")
  39e3a03eea5b ("PCI: mobiveil: Collect the interrupt related operations into a function")
  2ba24842d6b4 ("PCI: mobiveil: Move the host initialization into a function")
  1f442218d657 ("PCI: mobiveil: Introduce a new structure mobiveil_root_port")

I dropped that mobiveil branch for now, so Hou, can you please check
this out and resolve it one way or the other?

> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:375:15: error: variable ‘mobiveil_msi_domain_info’ has initializer but incomplete type
>  static struct msi_domain_info mobiveil_msi_domain_info = {
>                ^~~~~~~~~~~~~~~
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:376:3: error: ‘struct msi_domain_info’ has no member named ‘flags’
>   .flags = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>    ^~~~~
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:376:12: error: ‘MSI_FLAG_USE_DEF_DOM_OPS’ undeclared here (not in a function); did you mean ‘SIMPLE_DEV_PM_OPS’?
>   .flags = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>             ^~~~~~~~~~~~~~~~~~~~~~~~
>             SIMPLE_DEV_PM_OPS
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:376:39: error: ‘MSI_FLAG_USE_DEF_CHIP_OPS’ undeclared here (not in a function); did you mean ‘MSI_FLAG_USE_DEF_DOM_OPS’?
>   .flags = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
>                                        MSI_FLAG_USE_DEF_DOM_OPS
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:377:6: error: ‘MSI_FLAG_PCI_MSIX’ undeclared here (not in a function); did you mean ‘SS_FLAG_BITS’?
>       MSI_FLAG_PCI_MSIX),
>       ^~~~~~~~~~~~~~~~~
>       SS_FLAG_BITS
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:376:11: warning: excess elements in struct initializer
>   .flags = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>            ^
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:376:11: note: (near initialization for ‘mobiveil_msi_domain_info’)
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:378:3: error: ‘struct msi_domain_info’ has no member named ‘chip’
>   .chip = &mobiveil_msi_irq_chip,
>    ^~~~
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:378:10: warning: excess elements in struct initializer
>   .chip = &mobiveil_msi_irq_chip,
>           ^
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:378:10: note: (near initialization for ‘mobiveil_msi_domain_info’)
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c: In function ‘mobiveil_allocate_msi_domains’:
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:469:20: error: implicit declaration of function ‘pci_msi_create_irq_domain’; did you mean ‘pci_msi_get_device_domain’? [-Werror=implicit-function-declaration]
>   msi->msi_domain = pci_msi_create_irq_domain(fwnode,
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>                     pci_msi_get_device_domain
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:469:18: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   msi->msi_domain = pci_msi_create_irq_domain(fwnode,
>                   ^
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c: At top level:
> ../drivers/pci/controller/mobiveil/pcie-mobiveil-host.c:375:31: error: storage size of ‘mobiveil_msi_domain_info’ isn’t known
>  static struct msi_domain_info mobiveil_msi_domain_info = {
>                                ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> 
> Full randconfig file is attached.
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 5.6.0-rc5 Kernel Configuration
> #
> 
> #
> # Compiler: gcc (SUSE Linux) 7.5.0
> #
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=70500
> CONFIG_CLANG_VERSION=0
> CONFIG_CC_CAN_LINK=y
> CONFIG_CC_HAS_ASM_GOTO=y
> CONFIG_CC_HAS_ASM_INLINE=y
> CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
> CONFIG_CONSTRUCTORS=y
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
> CONFIG_THREAD_INFO_IN_TASK=y
> 
> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=y
> CONFIG_INIT_ENV_ARG_LIMIT=32
> CONFIG_COMPILE_TEST=y
> CONFIG_LOCALVERSION=""
> CONFIG_BUILD_SALT=""
> CONFIG_HAVE_KERNEL_GZIP=y
> CONFIG_HAVE_KERNEL_BZIP2=y
> CONFIG_HAVE_KERNEL_LZMA=y
> CONFIG_HAVE_KERNEL_XZ=y
> CONFIG_HAVE_KERNEL_LZO=y
> CONFIG_HAVE_KERNEL_LZ4=y
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=y
> CONFIG_DEFAULT_HOSTNAME="(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_WATCH_QUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> 
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=y
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_CHIP=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_SIM=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_IRQ_MSI_IOMMU=y
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
> CONFIG_IRQ_FORCED_THREADING=y
> CONFIG_SPARSE_IRQ=y
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
> 
> CONFIG_CLOCKSOURCE_WATCHDOG=y
> CONFIG_ARCH_CLOCKSOURCE_INIT=y
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
> CONFIG_GENERIC_TIME_VSYSCALL=y
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
> CONFIG_GENERIC_CMOS_UPDATE=y
> 
> #
> # Timers subsystem
> #
> CONFIG_HZ_PERIODIC=y
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=y
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> 
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=y
> CONFIG_PREEMPT_COUNT=y
> CONFIG_PREEMPTION=y
> 
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> CONFIG_IRQ_TIME_ACCOUNTING=y
> # CONFIG_BSD_PROCESS_ACCT is not set
> CONFIG_PSI=y
> # CONFIG_PSI_DEFAULT_DISABLED is not set
> # end of CPU/Task time and stats accounting
> 
> CONFIG_CPU_ISOLATION=y
> 
> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=y
> CONFIG_PREEMPT_RCU=y
> CONFIG_RCU_EXPERT=y
> CONFIG_SRCU=y
> CONFIG_TREE_SRCU=y
> CONFIG_TASKS_RCU_GENERIC=y
> CONFIG_TASKS_RCU=y
> CONFIG_RCU_STALL_COMMON=y
> CONFIG_RCU_NEED_SEGCBLIST=y
> CONFIG_RCU_FANOUT=32
> CONFIG_RCU_FANOUT_LEAF=16
> CONFIG_RCU_BOOST=y
> CONFIG_RCU_BOOST_DELAY=500
> CONFIG_RCU_NOCB_CPU=y
> # end of RCU Subsystem
> 
> CONFIG_IKCONFIG=y
> CONFIG_IKHEADERS=y
> CONFIG_LOG_BUF_SHIFT=17
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
> 
> #
> # Scheduler features
> #
> # end of Scheduler features
> 
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
> CONFIG_CC_HAS_INT128=y
> # CONFIG_CGROUPS is not set
> # CONFIG_NAMESPACES is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_SCHED_AUTOGROUP is not set
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
> CONFIG_RELAY=y
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE=""
> # CONFIG_RD_GZIP is not set
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> CONFIG_BOOT_CONFIG=y
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_HAVE_UID16=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> CONFIG_HAVE_PCSPKR_PLATFORM=y
> CONFIG_EXPERT=y
> CONFIG_UID16=y
> CONFIG_MULTIUSER=y
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=y
> # CONFIG_FHANDLE is not set
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_PRINTK=y
> CONFIG_PRINTK_NMI=y
> CONFIG_BUG=y
> CONFIG_ELF_CORE=y
> # CONFIG_PCSPKR_PLATFORM is not set
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=y
> CONFIG_FUTEX_PI=y
> # CONFIG_EPOLL is not set
> CONFIG_SIGNALFD=y
> CONFIG_TIMERFD=y
> CONFIG_EVENTFD=y
> CONFIG_SHMEM=y
> CONFIG_AIO=y
> # CONFIG_IO_URING is not set
> CONFIG_ADVISE_SYSCALLS=y
> CONFIG_MEMBARRIER=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
> # CONFIG_RSEQ is not set
> CONFIG_EMBEDDED=y
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_USE_VMALLOC=y
> CONFIG_PC104=y
> 
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=y
> CONFIG_DEBUG_PERF_USE_VMALLOC=y
> # end of Kernel Performance Events And Counters
> 
> # CONFIG_VM_EVENT_COUNTERS is not set
> CONFIG_SLUB_DEBUG=y
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=y
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=y
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> CONFIG_SYSTEM_DATA_VERIFICATION=y
> # CONFIG_PROFILING is not set
> # end of General setup
> 
> CONFIG_X86_32=y
> CONFIG_X86=y
> CONFIG_INSTRUCTION_DECODER=y
> CONFIG_OUTPUT_FORMAT="elf32-i386"
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_MMU=y
> CONFIG_ARCH_MMAP_RND_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=16
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
> CONFIG_GENERIC_ISA_DMA=y
> CONFIG_GENERIC_BUG=y
> CONFIG_ARCH_MAY_HAVE_PC_FDC=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_ARCH_HAS_CPU_RELAX=y
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
> CONFIG_ARCH_HAS_FILTER_PGPROT=y
> CONFIG_HAVE_SETUP_PER_CPU_AREA=y
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> CONFIG_ARCH_SUSPEND_POSSIBLE=y
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> CONFIG_X86_32_LAZY_GS=y
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_FIX_EARLYCON_MEM=y
> CONFIG_PGTABLE_LEVELS=3
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=y
> 
> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=y
> CONFIG_X86_MPPARSE=y
> CONFIG_GOLDFISH=y
> # CONFIG_RETPOLINE is not set
> CONFIG_X86_CPU_RESCTRL=y
> CONFIG_X86_EXTENDED_PLATFORM=y
> CONFIG_X86_GOLDFISH=y
> CONFIG_IOSF_MBI=m
> CONFIG_IOSF_MBI_DEBUG=y
> CONFIG_X86_RDC321X=y
> CONFIG_X86_32_IRIS=m
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> # CONFIG_HYPERVISOR_GUEST is not set
> # CONFIG_M486SX is not set
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> CONFIG_MPENTIUMII=y
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> # CONFIG_MK8 is not set
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> # CONFIG_MELAN is not set
> # CONFIG_MGEODEGX1 is not set
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> # CONFIG_MVIAC3_2 is not set
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> # CONFIG_X86_GENERIC is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=5
> CONFIG_X86_L1_CACHE_SHIFT=5
> CONFIG_X86_INTEL_USERCOPY=y
> CONFIG_X86_USE_PPRO_CHECKSUM=y
> CONFIG_X86_TSC=y
> CONFIG_X86_CMPXCHG64=y
> CONFIG_X86_CMOV=y
> CONFIG_X86_MINIMUM_CPU_FAMILY=6
> CONFIG_X86_DEBUGCTLMSR=y
> CONFIG_IA32_FEAT_CTL=y
> CONFIG_X86_VMX_FEATURE_NAMES=y
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=y
> CONFIG_CPU_SUP_CYRIX_32=y
> CONFIG_CPU_SUP_AMD=y
> CONFIG_CPU_SUP_HYGON=y
> CONFIG_CPU_SUP_CENTAUR=y
> CONFIG_CPU_SUP_TRANSMETA_32=y
> CONFIG_CPU_SUP_UMC_32=y
> CONFIG_CPU_SUP_ZHAOXIN=y
> CONFIG_HPET_TIMER=y
> CONFIG_HPET_EMULATE_RTC=y
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=1
> CONFIG_NR_CPUS_RANGE_END=1
> CONFIG_NR_CPUS_DEFAULT=1
> CONFIG_NR_CPUS=1
> CONFIG_UP_LATE_INIT=y
> CONFIG_X86_UP_APIC=y
> CONFIG_X86_UP_IOAPIC=y
> CONFIG_X86_LOCAL_APIC=y
> CONFIG_X86_IO_APIC=y
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=y
> # CONFIG_X86_MCELOG_LEGACY is not set
> CONFIG_X86_MCE_INTEL=y
> # CONFIG_X86_MCE_AMD is not set
> CONFIG_X86_ANCIENT_MCE=y
> CONFIG_X86_MCE_THRESHOLD=y
> # CONFIG_X86_MCE_INJECT is not set
> CONFIG_X86_THERMAL_VECTOR=y
> 
> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=y
> # CONFIG_PERF_EVENTS_INTEL_RAPL is not set
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> CONFIG_PERF_EVENTS_AMD_POWER=m
> # end of Performance monitoring
> 
> # CONFIG_X86_LEGACY_VM86 is not set
> # CONFIG_X86_IOPL_IOPERM is not set
> CONFIG_TOSHIBA=m
> CONFIG_I8K=y
> CONFIG_X86_REBOOTFIXUPS=y
> CONFIG_MICROCODE=y
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=y
> CONFIG_X86_MSR=m
> # CONFIG_X86_CPUID is not set
> CONFIG_NOHIGHMEM=y
> # CONFIG_HIGHMEM4G is not set
> # CONFIG_HIGHMEM64G is not set
> # CONFIG_VMSPLIT_3G is not set
> # CONFIG_VMSPLIT_2G is not set
> CONFIG_VMSPLIT_1G=y
> CONFIG_PAGE_OFFSET=0x40000000
> CONFIG_X86_PAE=y
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_ARCH_FLATMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_ARCH_SELECT_MEMORY_MODEL=y
> CONFIG_ILLEGAL_POINTER_VALUE=0
> CONFIG_X86_CHECK_BIOS_CORRUPTION=y
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=y
> # CONFIG_X86_UMIP is not set
> CONFIG_X86_INTEL_TSX_MODE_OFF=y
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=y
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=250
> # CONFIG_KEXEC is not set
> CONFIG_PHYSICAL_START=0x1000000
> CONFIG_RELOCATABLE=y
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_X86_NEED_RELOCS=y
> CONFIG_PHYSICAL_ALIGN=0x200000
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> # end of Processor type and features
> 
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
> 
> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=y
> CONFIG_SUSPEND_FREEZER=y
> # CONFIG_SUSPEND_SKIP_SYNC is not set
> CONFIG_PM_SLEEP=y
> # CONFIG_PM_AUTOSLEEP is not set
> CONFIG_PM_WAKELOCKS=y
> CONFIG_PM_WAKELOCKS_LIMIT=100
> CONFIG_PM_WAKELOCKS_GC=y
> CONFIG_PM=y
> CONFIG_PM_DEBUG=y
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_TEST_SUSPEND=y
> CONFIG_PM_SLEEP_DEBUG=y
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=y
> CONFIG_PM_GENERIC_DOMAINS=y
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
> CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
> CONFIG_PM_GENERIC_DOMAINS_OF=y
> CONFIG_ARCH_SUPPORTS_ACPI=y
> # CONFIG_ACPI is not set
> # CONFIG_SFI is not set
> CONFIG_X86_APM_BOOT=y
> CONFIG_APM=y
> # CONFIG_APM_IGNORE_USER_SUSPEND is not set
> CONFIG_APM_DO_ENABLE=y
> CONFIG_APM_CPU_IDLE=y
> # CONFIG_APM_DISPLAY_BLANK is not set
> # CONFIG_APM_ALLOW_INTS is not set
> 
> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> # end of CPU Frequency scaling
> 
> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=y
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=y
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # end of CPU Idle
> 
> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> 
> #
> # Bus options (PCI etc.)
> #
> # CONFIG_PCI_GOBIOS is not set
> CONFIG_PCI_GOMMCONFIG=y
> # CONFIG_PCI_GODIRECT is not set
> # CONFIG_PCI_GOANY is not set
> CONFIG_PCI_DIRECT=y
> CONFIG_PCI_CNB20LE_QUIRK=y
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=y
> CONFIG_ISA=y
> CONFIG_SCx200=y
> CONFIG_SCx200HR_TIMER=y
> # CONFIG_ALIX is not set
> CONFIG_NET5501=y
> CONFIG_AMD_NB=y
> # CONFIG_X86_SYSFB is not set
> # end of Bus options (PCI etc.)
> 
> #
> # Binary Emulations
> #
> CONFIG_COMPAT_32=y
> # end of Binary Emulations
> 
> CONFIG_HAVE_ATOMIC_IOMAP=y
> 
> #
> # Firmware Drivers
> #
> CONFIG_ARM_SCMI_PROTOCOL=y
> CONFIG_ARM_SCMI_POWER_DOMAIN=m
> CONFIG_ARM_SCPI_PROTOCOL=y
> CONFIG_ARM_SCPI_POWER_DOMAIN=y
> # CONFIG_EDD is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_FW_CFG_SYSFS=m
> CONFIG_FW_CFG_SYSFS_CMDLINE=y
> CONFIG_TURRIS_MOX_RWTM=m
> CONFIG_BCM47XX_NVRAM=y
> # CONFIG_BCM47XX_SPROM is not set
> # CONFIG_TEE_BNXT_FW is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> # CONFIG_IMX_DSP is not set
> CONFIG_IMX_SCU=y
> CONFIG_IMX_SCU_PD=y
> 
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> 
> CONFIG_HAVE_KVM=y
> CONFIG_VIRTUALIZATION=y
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> 
> #
> # General architecture-dependent options
> #
> CONFIG_HAVE_OPROFILE=y
> CONFIG_OPROFILE_NMI_TIMER=y
> CONFIG_KPROBES=y
> CONFIG_JUMP_LABEL=y
> CONFIG_STATIC_KEYS_SELFTEST=y
> CONFIG_OPTPROBES=y
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
> CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> CONFIG_KRETPROBES=y
> CONFIG_HAVE_IOREMAP_PROT=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_OPTPROBES=y
> CONFIG_HAVE_KPROBES_ON_FTRACE=y
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> CONFIG_HAVE_NMI=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_HAVE_DMA_CONTIGUOUS=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> CONFIG_ARCH_HAS_SET_MEMORY=y
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
> CONFIG_ARCH_32BIT_OFF_T=y
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_RSEQ=y
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_HW_BREAKPOINT=y
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
> CONFIG_HAVE_USER_RETURN_NOTIFIER=y
> CONFIG_HAVE_PERF_EVENTS_NMI=y
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
> CONFIG_HAVE_PERF_REGS=y
> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
> CONFIG_HAVE_CMPXCHG_LOCAL=y
> CONFIG_HAVE_CMPXCHG_DOUBLE=y
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> CONFIG_HAVE_ARCH_STACKLEAK=y
> CONFIG_HAVE_STACKPROTECTOR=y
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
> # CONFIG_STACKPROTECTOR is not set
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_MOVE_PMD=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> CONFIG_HAVE_ARCH_HUGE_VMAP=y
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> CONFIG_MODULES_USE_ELF_REL=y
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> CONFIG_HAVE_EXIT_THREAD=y
> CONFIG_ARCH_MMAP_RND_BITS=8
> CONFIG_HAVE_COPY_THREAD_TLS=y
> CONFIG_ISA_BUS_API=y
> CONFIG_CLONE_BACKWARDS=y
> CONFIG_OLD_SIGSUSPEND3=y
> CONFIG_OLD_SIGACTION=y
> # CONFIG_COMPAT_32BIT_TIME is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> CONFIG_STRICT_KERNEL_RWX=y
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> CONFIG_STRICT_MODULE_RWX=y
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=y
> 
> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=y
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> CONFIG_GCOV_FORMAT_4_7=y
> # end of GCOV-based kernel profiling
> 
> CONFIG_PLUGIN_HOSTCC=""
> CONFIG_HAVE_GCC_PLUGINS=y
> # end of General architecture-dependent options
> 
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=1
> CONFIG_MODULES=y
> CONFIG_MODULE_FORCE_LOAD=y
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_TRIM_UNUSED_KSYMS=y
> CONFIG_UNUSED_KSYMS_WHITELIST=""
> CONFIG_MODULES_TREE_LOOKUP=y
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=y
> CONFIG_UNINLINE_SPIN_UNLOCK=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
> CONFIG_FREEZER=y
> 
> #
> # Executable file formats
> #
> # CONFIG_BINFMT_ELF is not set
> # CONFIG_BINFMT_SCRIPT is not set
> CONFIG_BINFMT_MISC=m
> CONFIG_COREDUMP=y
> # end of Executable file formats
> 
> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=y
> # CONFIG_FLATMEM_MANUAL is not set
> CONFIG_SPARSEMEM_MANUAL=y
> CONFIG_SPARSEMEM=y
> CONFIG_HAVE_MEMORY_PRESENT=y
> CONFIG_SPARSEMEM_STATIC=y
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
> CONFIG_HAVE_FAST_GUP=y
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_COMPACTION=y
> CONFIG_PAGE_REPORTING=y
> CONFIG_MIGRATION=y
> CONFIG_PHYS_ADDR_T_64BIT=y
> CONFIG_VIRT_TO_BUS=y
> CONFIG_MMU_NOTIFIER=y
> CONFIG_KSM=y
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> CONFIG_TRANSPARENT_HUGEPAGE=y
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=y
> CONFIG_NEED_PER_CPU_KM=y
> CONFIG_CLEANCACHE=y
> # CONFIG_CMA is not set
> # CONFIG_ZPOOL is not set
> CONFIG_ZBUD=y
> CONFIG_ZSMALLOC=y
> CONFIG_PGTABLE_MAPPING=y
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=y
> CONFIG_IDLE_PAGE_TRACKING=y
> CONFIG_FRAME_VECTOR=y
> CONFIG_PERCPU_STATS=y
> # CONFIG_GUP_BENCHMARK is not set
> CONFIG_GUP_GET_PTE_LOW_HIGH=y
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> CONFIG_MAPPING_DIRTY_HELPERS=y
> # end of Memory Management options
> 
> # CONFIG_NET is not set
> CONFIG_HAVE_EBPF_JIT=y
> 
> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=y
> CONFIG_EISA=y
> CONFIG_EISA_VLB_PRIMING=y
> CONFIG_EISA_PCI_EISA=y
> CONFIG_EISA_VIRTUAL_ROOT=y
> CONFIG_EISA_NAMES=y
> CONFIG_HAVE_PCI=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> CONFIG_PCIEPORTBUS=y
> # CONFIG_HOTPLUG_PCI_PCIE is not set
> # CONFIG_PCIEAER is not set
> CONFIG_PCIEASPM=y
> # CONFIG_PCIEASPM_DEFAULT is not set
> # CONFIG_PCIEASPM_POWERSAVE is not set
> CONFIG_PCIEASPM_POWER_SUPERSAVE=y
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=y
> CONFIG_PCIE_PTM=y
> CONFIG_PCIE_BW=y
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_QUIRKS is not set
> CONFIG_PCI_DEBUG=y
> CONFIG_PCI_REALLOC_ENABLE_AUTO=y
> CONFIG_PCI_STUB=y
> CONFIG_PCI_PF_STUB=y
> CONFIG_PCI_ATS=y
> CONFIG_PCI_ECAM=y
> CONFIG_PCI_LOCKLESS_CONFIG=y
> CONFIG_PCI_IOV=y
> CONFIG_PCI_PRI=y
> CONFIG_PCI_PASID=y
> CONFIG_HOTPLUG_PCI=y
> CONFIG_HOTPLUG_PCI_CPCI=y
> # CONFIG_HOTPLUG_PCI_CPCI_ZT5550 is not set
> # CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
> CONFIG_HOTPLUG_PCI_SHPC=y
> 
> #
> # PCI controller drivers
> #
> # CONFIG_PCI_FTPCI100 is not set
> CONFIG_PCI_HOST_COMMON=y
> CONFIG_PCI_HOST_GENERIC=y
> CONFIG_PCIE_XILINX=y
> # CONFIG_PCI_XGENE is not set
> # CONFIG_PCI_V3_SEMI is not set
> CONFIG_PCI_VERSATILE=y
> CONFIG_PCIE_ALTERA=y
> CONFIG_PCI_HOST_THUNDER_PEM=y
> CONFIG_PCI_HOST_THUNDER_ECAM=y
> CONFIG_PCIE_ROCKCHIP=y
> CONFIG_PCIE_ROCKCHIP_EP=y
> 
> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=y
> CONFIG_PCIE_DW_EP=y
> CONFIG_PCI_DRA7XX=y
> CONFIG_PCI_DRA7XX_EP=y
> CONFIG_PCI_LAYERSCAPE_EP=y
> CONFIG_PCIE_ARTPEC6=y
> CONFIG_PCIE_ARTPEC6_EP=y
> # end of DesignWare PCI Core Support
> 
> #
> # Mobiveil PCIe Core Support
> #
> CONFIG_PCIE_MOBIVEIL_HOST=y
> CONFIG_PCIE_MOBIVEIL_PLAT=y
> # end of Mobiveil PCIe Core Support
> 
> #
> # Cadence PCIe controllers support
> #
> # CONFIG_PCIE_CADENCE_PLAT_HOST is not set
> # CONFIG_PCIE_CADENCE_PLAT_EP is not set
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> 
> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=y
> # CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> CONFIG_PCI_EPF_TEST=y
> # end of PCI Endpoint
> 
> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=y
> # end of PCI switch controller drivers
> 
> CONFIG_PCCARD=y
> CONFIG_PCMCIA=m
> # CONFIG_PCMCIA_LOAD_CIS is not set
> # CONFIG_CARDBUS is not set
> 
> #
> # PC-card bridges
> #
> CONFIG_YENTA=m
> # CONFIG_YENTA_O2 is not set
> CONFIG_YENTA_RICOH=y
> # CONFIG_YENTA_TI is not set
> # CONFIG_YENTA_TOSHIBA is not set
> CONFIG_PD6729=m
> # CONFIG_I82092 is not set
> # CONFIG_I82365 is not set
> CONFIG_TCIC=m
> CONFIG_PCMCIA_PROBE=y
> CONFIG_PCCARD_NONSTATIC=y
> CONFIG_RAPIDIO=y
> # CONFIG_RAPIDIO_TSI721 is not set
> CONFIG_RAPIDIO_DISC_TIMEOUT=30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> CONFIG_RAPIDIO_DEBUG=y
> # CONFIG_RAPIDIO_ENUM_BASIC is not set
> CONFIG_RAPIDIO_CHMAN=y
> CONFIG_RAPIDIO_MPORT_CDEV=m
> 
> #
> # RapidIO Switch drivers
> #
> # CONFIG_RAPIDIO_TSI57X is not set
> CONFIG_RAPIDIO_CPS_XX=y
> CONFIG_RAPIDIO_TSI568=m
> CONFIG_RAPIDIO_CPS_GEN2=y
> # CONFIG_RAPIDIO_RXS_GEN3 is not set
> # end of RapidIO Switch drivers
> 
> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=y
> CONFIG_UEVENT_HELPER_PATH=""
> # CONFIG_DEVTMPFS is not set
> CONFIG_STANDALONE=y
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> 
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_EXTRA_FIRMWARE=""
> CONFIG_FW_LOADER_USER_HELPER=y
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> CONFIG_FW_LOADER_COMPRESS=y
> CONFIG_FW_CACHE=y
> # end of Firmware loader
> 
> CONFIG_WANT_DEV_COREDUMP=y
> CONFIG_ALLOW_DEV_COREDUMP=y
> CONFIG_DEV_COREDUMP=y
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
> # CONFIG_PM_QOS_KUNIT_TEST is not set
> CONFIG_TEST_ASYNC_DRIVER_PROBE=m
> CONFIG_KUNIT_DRIVER_PE_TEST=y
> CONFIG_GENERIC_CPU_AUTOPROBE=y
> CONFIG_GENERIC_CPU_VULNERABILITIES=y
> CONFIG_SOC_BUS=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_AC97=m
> CONFIG_REGMAP_I2C=m
> CONFIG_REGMAP_SLIMBUS=m
> CONFIG_REGMAP_SPI=y
> CONFIG_REGMAP_SPMI=y
> CONFIG_REGMAP_W1=y
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_SOUNDWIRE=m
> CONFIG_REGMAP_I3C=m
> CONFIG_DMA_SHARED_BUFFER=y
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> 
> #
> # Bus devices
> #
> CONFIG_MOXTET=m
> # CONFIG_HISILICON_LPC is not set
> CONFIG_QCOM_EBI2=y
> CONFIG_SIMPLE_PM_BUS=y
> # CONFIG_FSL_MC_BUS is not set
> # end of Bus devices
> 
> CONFIG_GNSS=m
> CONFIG_GNSS_SERIAL=m
> # CONFIG_GNSS_MTK_SERIAL is not set
> # CONFIG_GNSS_SIRF_SERIAL is not set
> CONFIG_GNSS_UBX_SERIAL=m
> CONFIG_MTD=m
> CONFIG_MTD_TESTS=m
> 
> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=m
> CONFIG_MTD_BCM63XX_PARTS=m
> # CONFIG_MTD_CMDLINE_PARTS is not set
> # CONFIG_MTD_OF_PARTS is not set
> CONFIG_MTD_PARSER_IMAGETAG=m
> CONFIG_MTD_PARSER_TRX=m
> CONFIG_MTD_SHARPSL_PARTS=m
> CONFIG_MTD_REDBOOT_PARTS=m
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
> 
> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_OOPS=m
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> 
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=m
> CONFIG_MTD_JEDECPROBE=m
> CONFIG_MTD_GEN_PROBE=m
> CONFIG_MTD_CFI_ADV_OPTIONS=y
> CONFIG_MTD_CFI_NOSWAP=y
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> # CONFIG_MTD_CFI_GEOMETRY is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> CONFIG_MTD_MAP_BANK_WIDTH_4=y
> CONFIG_MTD_CFI_I1=y
> CONFIG_MTD_CFI_I2=y
> # CONFIG_MTD_OTP is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=m
> CONFIG_MTD_CFI_STAA=m
> CONFIG_MTD_CFI_UTIL=m
> CONFIG_MTD_RAM=m
> CONFIG_MTD_ROM=m
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
> 
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=y
> CONFIG_MTD_PHYSMAP=m
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> # CONFIG_MTD_PHYSMAP_OF is not set
> # CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
> CONFIG_MTD_SC520CDP=m
> CONFIG_MTD_NETSC520=m
> # CONFIG_MTD_TS5500 is not set
> CONFIG_MTD_SCx200_DOCFLASH=m
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=m
> CONFIG_MTD_ESB2ROM=m
> # CONFIG_MTD_CK804XROM is not set
> CONFIG_MTD_SCB2_FLASH=m
> CONFIG_MTD_NETtel=m
> CONFIG_MTD_L440GX=m
> CONFIG_MTD_PCI=m
> CONFIG_MTD_PCMCIA=m
> CONFIG_MTD_PCMCIA_ANONYMOUS=y
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=m
> # end of Mapping drivers for chip access
> 
> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=m
> # CONFIG_MTD_PMC551_BUGFIX is not set
> CONFIG_MTD_PMC551_DEBUG=y
> # CONFIG_MTD_DATAFLASH is not set
> CONFIG_MTD_MCHP23K256=m
> CONFIG_MTD_SST25L=m
> CONFIG_MTD_SLRAM=m
> CONFIG_MTD_PHRAM=m
> CONFIG_MTD_MTDRAM=m
> CONFIG_MTDRAM_TOTAL_SIZE=4096
> CONFIG_MTDRAM_ERASE_SIZE=128
> 
> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> # end of Self-contained MTD device drivers
> 
> CONFIG_MTD_NAND_CORE=m
> CONFIG_MTD_ONENAND=m
> CONFIG_MTD_ONENAND_VERIFY_WRITE=y
> CONFIG_MTD_ONENAND_GENERIC=m
> CONFIG_MTD_ONENAND_SAMSUNG=m
> # CONFIG_MTD_ONENAND_OTP is not set
> CONFIG_MTD_ONENAND_2X_PROGRAM=y
> # CONFIG_MTD_RAW_NAND is not set
> CONFIG_MTD_SPI_NAND=m
> 
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=m
> CONFIG_MTD_QINFO_PROBE=m
> # end of LPDDR & LPDDR2 PCM memory drivers
> 
> CONFIG_MTD_SPI_NOR=m
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
> # CONFIG_SPI_ASPEED_SMC is not set
> # CONFIG_SPI_CADENCE_QUADSPI is not set
> CONFIG_SPI_HISI_SFC=m
> CONFIG_SPI_NXP_SPIFI=m
> CONFIG_SPI_INTEL_SPI=m
> CONFIG_SPI_INTEL_SPI_PCI=m
> # CONFIG_SPI_INTEL_SPI_PLATFORM is not set
> CONFIG_MTD_UBI=m
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> CONFIG_MTD_UBI_FASTMAP=y
> CONFIG_MTD_UBI_GLUEBI=m
> # CONFIG_MTD_HYPERBUS is not set
> CONFIG_DTC=y
> CONFIG_OF=y
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_ALL_DTBS=y
> CONFIG_OF_FLATTREE=y
> CONFIG_OF_KOBJ=y
> CONFIG_OF_DYNAMIC=y
> CONFIG_OF_ADDRESS=y
> CONFIG_OF_IRQ=y
> CONFIG_OF_RESOLVE=y
> CONFIG_OF_OVERLAY=y
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
> # CONFIG_PARPORT is not set
> CONFIG_PNP=y
> CONFIG_PNP_DEBUG_MESSAGES=y
> 
> #
> # Protocols
> #
> CONFIG_ISAPNP=y
> CONFIG_PNPBIOS=y
> 
> #
> # NVME Support
> #
> # end of NVME Support
> 
> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=y
> # CONFIG_AD525X_DPOT_I2C is not set
> # CONFIG_AD525X_DPOT_SPI is not set
> CONFIG_DUMMY_IRQ=y
> CONFIG_IBM_ASM=m
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=m
> CONFIG_TIFM_7XX1=m
> # CONFIG_ICS932S401 is not set
> CONFIG_ATMEL_SSC=m
> CONFIG_ENCLOSURE_SERVICES=y
> CONFIG_CS5535_MFGPT=m
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=7
> CONFIG_CS5535_CLOCK_EVENT_SRC=m
> # CONFIG_HP_ILO is not set
> # CONFIG_QCOM_COINCELL is not set
> CONFIG_QCOM_FASTRPC=y
> CONFIG_APDS9802ALS=m
> CONFIG_ISL29003=m
> CONFIG_ISL29020=m
> CONFIG_SENSORS_TSL2550=m
> CONFIG_SENSORS_BH1770=m
> CONFIG_SENSORS_APDS990X=m
> CONFIG_HMC6352=m
> # CONFIG_DS1682 is not set
> CONFIG_PCH_PHUB=y
> CONFIG_LATTICE_ECP3_CONFIG=y
> CONFIG_SRAM=y
> CONFIG_PCI_ENDPOINT_TEST=y
> CONFIG_XILINX_SDFEC=m
> CONFIG_PVPANIC=m
> # CONFIG_C2PORT is not set
> 
> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> # CONFIG_EEPROM_AT25 is not set
> # CONFIG_EEPROM_LEGACY is not set
> CONFIG_EEPROM_MAX6875=m
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_EEPROM_93XX46=y
> # CONFIG_EEPROM_IDT_89HPESX is not set
> CONFIG_EEPROM_EE1004=m
> # end of EEPROM support
> 
> # CONFIG_CB710_CORE is not set
> 
> #
> # Texas Instruments shared transport line discipline
> #
> # end of Texas Instruments shared transport line discipline
> 
> # CONFIG_SENSORS_LIS3_SPI is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
> 
> #
> # Altera FPGA firmware download module (requires I2C)
> #
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=m
> CONFIG_INTEL_MEI_ME=m
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_INTEL_MEI_HDCP is not set
> CONFIG_VMWARE_VMCI=m
> 
> #
> # Intel MIC & related support
> #
> # CONFIG_VOP_BUS is not set
> # end of Intel MIC & related support
> 
> # CONFIG_ECHO is not set
> CONFIG_MISC_ALCOR_PCI=y
> # CONFIG_MISC_RTSX_PCI is not set
> # CONFIG_MISC_RTSX_USB is not set
> CONFIG_HABANA_AI=y
> CONFIG_UACCE=y
> # end of Misc devices
> 
> CONFIG_HAVE_IDE=y
> 
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=y
> # end of SCSI device support
> 
> # CONFIG_FUSION is not set
> 
> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=m
> CONFIG_FIREWIRE_OHCI=m
> CONFIG_FIREWIRE_NOSY=m
> # end of IEEE 1394 (FireWire) support
> 
> CONFIG_MACINTOSH_DRIVERS=y
> 
> #
> # Input device support
> #
> CONFIG_INPUT=y
> CONFIG_INPUT_LEDS=m
> CONFIG_INPUT_FF_MEMLESS=y
> CONFIG_INPUT_POLLDEV=y
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
> 
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=m
> CONFIG_INPUT_MOUSEDEV_PSAUX=y
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=y
> CONFIG_INPUT_EVBUG=y
> 
> #
> # Input Device Drivers
> #
> # CONFIG_INPUT_KEYBOARD is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=y
> CONFIG_JOYSTICK_ANALOG=y
> # CONFIG_JOYSTICK_A3D is not set
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> CONFIG_JOYSTICK_GF2K=y
> CONFIG_JOYSTICK_GRIP=m
> CONFIG_JOYSTICK_GRIP_MP=y
> CONFIG_JOYSTICK_GUILLEMOT=m
> # CONFIG_JOYSTICK_INTERACT is not set
> CONFIG_JOYSTICK_SIDEWINDER=m
> CONFIG_JOYSTICK_TMDC=m
> # CONFIG_JOYSTICK_IFORCE is not set
> CONFIG_JOYSTICK_WARRIOR=y
> CONFIG_JOYSTICK_MAGELLAN=y
> # CONFIG_JOYSTICK_SPACEORB is not set
> CONFIG_JOYSTICK_SPACEBALL=y
> CONFIG_JOYSTICK_STINGER=m
> CONFIG_JOYSTICK_TWIDJOY=m
> CONFIG_JOYSTICK_ZHENHUA=y
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=m
> # CONFIG_JOYSTICK_XPAD is not set
> # CONFIG_JOYSTICK_PSXPAD_SPI is not set
> CONFIG_JOYSTICK_PXRC=m
> # CONFIG_JOYSTICK_FSIA6B is not set
> CONFIG_INPUT_TABLET=y
> CONFIG_TABLET_USB_ACECAD=m
> CONFIG_TABLET_USB_AIPTEK=y
> CONFIG_TABLET_USB_GTCO=m
> CONFIG_TABLET_USB_HANWANG=y
> CONFIG_TABLET_USB_KBTAB=m
> CONFIG_TABLET_USB_PEGASUS=m
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=y
> CONFIG_RMI4_I2C=m
> CONFIG_RMI4_SPI=m
> CONFIG_RMI4_SMB=m
> CONFIG_RMI4_F03=y
> CONFIG_RMI4_F03_SERIO=y
> CONFIG_RMI4_2D_SENSOR=y
> CONFIG_RMI4_F11=y
> CONFIG_RMI4_F12=y
> CONFIG_RMI4_F30=y
> # CONFIG_RMI4_F34 is not set
> # CONFIG_RMI4_F55 is not set
> 
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
> CONFIG_SERIO_I8042=y
> CONFIG_SERIO_CT82C710=m
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=m
> CONFIG_SERIO_RAW=m
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=y
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_APBPS2=m
> # CONFIG_SERIO_OLPC_APSP is not set
> CONFIG_SERIO_SUN4I_PS2=y
> CONFIG_SERIO_GPIO_PS2=y
> CONFIG_USERIO=m
> CONFIG_GAMEPORT=y
> CONFIG_GAMEPORT_NS558=m
> # CONFIG_GAMEPORT_L4 is not set
> CONFIG_GAMEPORT_EMU10K1=y
> CONFIG_GAMEPORT_FM801=m
> # end of Hardware I/O ports
> # end of Input device support
> 
> #
> # Character devices
> #
> # CONFIG_TTY is not set
> CONFIG_DEVMEM=y
> CONFIG_DEVKMEM=y
> CONFIG_SERIAL_DEV_BUS=m
> CONFIG_IPMI_HANDLER=m
> CONFIG_IPMI_PLAT_DATA=y
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=m
> # CONFIG_IPMI_SSIF is not set
> CONFIG_IPMI_WATCHDOG=m
> CONFIG_IPMI_POWEROFF=m
> CONFIG_IPMI_KCS_BMC=y
> CONFIG_ASPEED_KCS_IPMI_BMC=m
> CONFIG_NPCM7XX_KCS_IPMI_BMC=y
> CONFIG_ASPEED_BT_IPMI_BMC=m
> CONFIG_IPMB_DEVICE_INTERFACE=m
> CONFIG_HW_RANDOM=m
> CONFIG_HW_RANDOM_TIMERIOMEM=m
> CONFIG_HW_RANDOM_INTEL=m
> # CONFIG_HW_RANDOM_AMD is not set
> # CONFIG_HW_RANDOM_GEODE is not set
> CONFIG_HW_RANDOM_VIA=m
> CONFIG_HW_RANDOM_VIRTIO=m
> # CONFIG_HW_RANDOM_IMX_RNGC is not set
> CONFIG_HW_RANDOM_STM32=m
> CONFIG_HW_RANDOM_MESON=m
> # CONFIG_HW_RANDOM_MTK is not set
> CONFIG_HW_RANDOM_EXYNOS=m
> # CONFIG_HW_RANDOM_NPCM is not set
> CONFIG_HW_RANDOM_KEYSTONE=y
> CONFIG_NVRAM=y
> CONFIG_DTLK=m
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> 
> #
> # PCMCIA character devices
> #
> CONFIG_CARDMAN_4000=m
> # CONFIG_CARDMAN_4040 is not set
> CONFIG_SCR24X=m
> # end of PCMCIA character devices
> 
> CONFIG_SCx200_GPIO=m
> CONFIG_PC8736x_GPIO=m
> CONFIG_NSC_GPIO=y
> # CONFIG_HANGCHECK_TIMER is not set
> # CONFIG_TCG_TPM is not set
> CONFIG_TELCLOCK=m
> CONFIG_DEVPORT=y
> CONFIG_XILLYBUS=m
> CONFIG_XILLYBUS_OF=m
> # end of Character devices
> 
> CONFIG_RANDOM_TRUST_BOOTLOADER=y
> 
> #
> # I2C support
> #
> CONFIG_I2C=m
> CONFIG_I2C_BOARDINFO=y
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=m
> CONFIG_I2C_MUX=m
> 
> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> CONFIG_I2C_MUX_GPIO=m
> CONFIG_I2C_MUX_GPMUX=m
> CONFIG_I2C_MUX_LTC4306=m
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=m
> CONFIG_I2C_MUX_PINCTRL=m
> CONFIG_I2C_MUX_REG=m
> CONFIG_I2C_DEMUX_PINCTRL=m
> CONFIG_I2C_MUX_MLXCPLD=m
> # end of Multiplexer I2C Chip support
> 
> CONFIG_I2C_HELPER_AUTO=y
> CONFIG_I2C_SMBUS=m
> CONFIG_I2C_ALGOBIT=m
> CONFIG_I2C_ALGOPCF=m
> CONFIG_I2C_ALGOPCA=m
> 
> #
> # I2C Hardware Bus support
> #
> 
> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> CONFIG_I2C_ALI1563=m
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=m
> # CONFIG_I2C_AMD756_S4882 is not set
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_HIX5HD2=m
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_ISMT=m
> # CONFIG_I2C_PIIX4 is not set
> CONFIG_I2C_NFORCE2=m
> # CONFIG_I2C_NFORCE2_S4985 is not set
> CONFIG_I2C_NVIDIA_GPU=m
> # CONFIG_I2C_SIS5595 is not set
> CONFIG_I2C_SIS630=m
> CONFIG_I2C_SIS96X=m
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=m
> 
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_ALTERA is not set
> CONFIG_I2C_ASPEED=m
> CONFIG_I2C_AT91=m
> CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=m
> CONFIG_I2C_AXXIA=m
> # CONFIG_I2C_BCM2835 is not set
> # CONFIG_I2C_BCM_IPROC is not set
> CONFIG_I2C_BCM_KONA=m
> # CONFIG_I2C_BRCMSTB is not set
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DAVINCI is not set
> CONFIG_I2C_DESIGNWARE_CORE=m
> CONFIG_I2C_DESIGNWARE_PLATFORM=m
> CONFIG_I2C_DESIGNWARE_SLAVE=y
> CONFIG_I2C_DESIGNWARE_PCI=m
> CONFIG_I2C_DIGICOLOR=m
> CONFIG_I2C_EFM32=m
> CONFIG_I2C_EG20T=m
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_EXYNOS5=m
> CONFIG_I2C_GPIO=m
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> CONFIG_I2C_HIGHLANDER=m
> CONFIG_I2C_IMG=m
> CONFIG_I2C_IMX_LPI2C=m
> # CONFIG_I2C_IOP3XX is not set
> CONFIG_I2C_JZ4780=m
> CONFIG_I2C_LPC2K=m
> # CONFIG_I2C_MESON is not set
> CONFIG_I2C_MT65XX=m
> CONFIG_I2C_MT7621=m
> # CONFIG_I2C_MV64XXX is not set
> CONFIG_I2C_MXS=m
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_OMAP is not set
> CONFIG_I2C_OWL=m
> CONFIG_I2C_PCA_PLATFORM=m
> CONFIG_I2C_PMCMSP=m
> CONFIG_I2C_PNX=m
> CONFIG_I2C_PXA=m
> CONFIG_I2C_PXA_PCI=y
> CONFIG_I2C_QCOM_GENI=m
> CONFIG_I2C_RIIC=m
> CONFIG_I2C_RK3X=m
> CONFIG_I2C_S3C2410=m
> CONFIG_I2C_SH_MOBILE=m
> CONFIG_I2C_SIMTEC=m
> CONFIG_I2C_SIRF=m
> CONFIG_I2C_ST=m
> CONFIG_I2C_STM32F4=m
> # CONFIG_I2C_STM32F7 is not set
> CONFIG_I2C_STU300=m
> CONFIG_I2C_SUN6I_P2WI=m
> # CONFIG_I2C_SYNQUACER is not set
> CONFIG_I2C_TEGRA_BPMP=m
> CONFIG_I2C_UNIPHIER=m
> CONFIG_I2C_UNIPHIER_F=m
> CONFIG_I2C_VERSATILE=m
> # CONFIG_I2C_WMT is not set
> CONFIG_I2C_XILINX=m
> CONFIG_I2C_XLR=m
> CONFIG_I2C_XLP9XX=m
> # CONFIG_I2C_RCAR is not set
> 
> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=m
> CONFIG_I2C_ROBOTFUZZ_OSIF=m
> # CONFIG_I2C_TINY_USB is not set
> # CONFIG_I2C_VIPERBOARD is not set
> 
> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_ELEKTOR=m
> # CONFIG_I2C_MLXCPLD is not set
> # CONFIG_I2C_PCA_ISA is not set
> CONFIG_SCx200_ACB=m
> CONFIG_I2C_FSI=m
> # end of I2C Hardware Bus support
> 
> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=y
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> CONFIG_I2C_DEBUG_ALGO=y
> CONFIG_I2C_DEBUG_BUS=y
> # end of I2C support
> 
> CONFIG_I3C=m
> # CONFIG_CDNS_I3C_MASTER is not set
> # CONFIG_DW_I3C_MASTER is not set
> CONFIG_SPI=y
> CONFIG_SPI_DEBUG=y
> CONFIG_SPI_MASTER=y
> CONFIG_SPI_MEM=y
> 
> #
> # SPI Master Controller Drivers
> #
> CONFIG_SPI_ALTERA=y
> # CONFIG_SPI_AR934X is not set
> CONFIG_SPI_ATH79=y
> CONFIG_SPI_ARMADA_3700=y
> CONFIG_SPI_ATMEL=m
> # CONFIG_SPI_AXI_SPI_ENGINE is not set
> CONFIG_SPI_BCM2835=m
> CONFIG_SPI_BCM2835AUX=y
> CONFIG_SPI_BCM63XX=y
> CONFIG_SPI_BCM63XX_HSSPI=y
> CONFIG_SPI_BCM_QSPI=y
> CONFIG_SPI_BITBANG=y
> # CONFIG_SPI_CADENCE is not set
> CONFIG_SPI_CLPS711X=y
> # CONFIG_SPI_DESIGNWARE is not set
> # CONFIG_SPI_EP93XX is not set
> # CONFIG_SPI_FSI is not set
> CONFIG_SPI_FSL_LPSPI=m
> CONFIG_SPI_FSL_QUADSPI=m
> CONFIG_SPI_HISI_SFC_V3XX=m
> # CONFIG_SPI_NXP_FLEXSPI is not set
> CONFIG_SPI_GPIO=y
> # CONFIG_SPI_IMG_SPFI is not set
> # CONFIG_SPI_IMX is not set
> CONFIG_SPI_JCORE=m
> CONFIG_SPI_LP8841_RTC=y
> CONFIG_SPI_FSL_LIB=m
> CONFIG_SPI_FSL_SPI=m
> CONFIG_SPI_FSL_DSPI=y
> CONFIG_SPI_MESON_SPICC=y
> CONFIG_SPI_MESON_SPIFC=m
> CONFIG_SPI_MT65XX=m
> CONFIG_SPI_MT7621=m
> CONFIG_SPI_MTK_NOR=m
> # CONFIG_SPI_NPCM_FIU is not set
> CONFIG_SPI_NPCM_PSPI=y
> CONFIG_SPI_LANTIQ_SSC=m
> # CONFIG_SPI_OC_TINY is not set
> # CONFIG_SPI_OMAP24XX is not set
> CONFIG_SPI_TI_QSPI=m
> CONFIG_SPI_OMAP_100K=y
> CONFIG_SPI_ORION=m
> CONFIG_SPI_PIC32=y
> CONFIG_SPI_PIC32_SQI=m
> # CONFIG_SPI_PXA2XX is not set
> CONFIG_SPI_ROCKCHIP=y
> # CONFIG_SPI_RSPI is not set
> CONFIG_SPI_QCOM_GENI=m
> CONFIG_SPI_S3C64XX=m
> CONFIG_SPI_SC18IS602=m
> CONFIG_SPI_SH_MSIOF=y
> CONFIG_SPI_SH=y
> # CONFIG_SPI_SH_HSPI is not set
> CONFIG_SPI_SIFIVE=y
> CONFIG_SPI_SPRD=m
> # CONFIG_SPI_SPRD_ADI is not set
> CONFIG_SPI_STM32=m
> CONFIG_SPI_STM32_QSPI=y
> # CONFIG_SPI_ST_SSC4 is not set
> CONFIG_SPI_SUN4I=y
> CONFIG_SPI_SUN6I=y
> # CONFIG_SPI_SYNQUACER is not set
> # CONFIG_SPI_MXIC is not set
> CONFIG_SPI_TEGRA114=y
> CONFIG_SPI_TEGRA20_SFLASH=y
> CONFIG_SPI_TEGRA20_SLINK=m
> # CONFIG_SPI_TOPCLIFF_PCH is not set
> # CONFIG_SPI_TXX9 is not set
> CONFIG_SPI_UNIPHIER=y
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_XLP is not set
> CONFIG_SPI_XTENSA_XTFPGA=m
> CONFIG_SPI_ZYNQ_QSPI=m
> CONFIG_SPI_ZYNQMP_GQSPI=m
> 
> #
> # SPI Multiplexer support
> #
> CONFIG_SPI_MUX=m
> 
> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=m
> CONFIG_SPI_LOOPBACK_TEST=m
> CONFIG_SPI_TLE62X0=y
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPMI=y
> CONFIG_SPMI_MSM_PMIC_ARB=y
> CONFIG_HSI=m
> CONFIG_HSI_BOARDINFO=y
> 
> #
> # HSI controllers
> #
> 
> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=m
> CONFIG_PPS=y
> CONFIG_PPS_DEBUG=y
> CONFIG_NTP_PPS=y
> 
> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_GPIO=y
> 
> #
> # PPS generators support
> #
> 
> #
> # PTP clock support
> #
> 
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> 
> CONFIG_PINCTRL=y
> CONFIG_GENERIC_PINCTRL_GROUPS=y
> CONFIG_PINMUX=y
> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> # CONFIG_DEBUG_PINCTRL is not set
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_BM1880=y
> # CONFIG_PINCTRL_DA850_PUPD is not set
> # CONFIG_PINCTRL_DA9062 is not set
> # CONFIG_PINCTRL_LPC18XX is not set
> # CONFIG_PINCTRL_MCP23S08 is not set
> CONFIG_PINCTRL_RZA1=y
> CONFIG_PINCTRL_RZA2=y
> CONFIG_PINCTRL_RZN1=y
> # CONFIG_PINCTRL_SINGLE is not set
> CONFIG_PINCTRL_STMFX=m
> CONFIG_PINCTRL_INGENIC=y
> CONFIG_PINCTRL_RK805=m
> # CONFIG_PINCTRL_OCELOT is not set
> # CONFIG_PINCTRL_OWL is not set
> CONFIG_PINCTRL_ASPEED=y
> # CONFIG_PINCTRL_ASPEED_G4 is not set
> # CONFIG_PINCTRL_ASPEED_G5 is not set
> CONFIG_PINCTRL_ASPEED_G6=y
> # CONFIG_PINCTRL_BCM281XX is not set
> CONFIG_PINCTRL_BCM2835=y
> # CONFIG_PINCTRL_IPROC_GPIO is not set
> CONFIG_PINCTRL_CYGNUS_MUX=y
> CONFIG_PINCTRL_NS=y
> CONFIG_PINCTRL_NSP_GPIO=y
> # CONFIG_PINCTRL_NS2_MUX is not set
> CONFIG_PINCTRL_NSP_MUX=y
> CONFIG_PINCTRL_BERLIN=y
> CONFIG_PINCTRL_AS370=y
> # CONFIG_PINCTRL_BERLIN_BG4CT is not set
> # CONFIG_PINCTRL_NPCM7XX is not set
> CONFIG_PINCTRL_PXA=y
> CONFIG_PINCTRL_PXA25X=y
> # CONFIG_PINCTRL_PXA27X is not set
> CONFIG_PINCTRL_MSM=y
> # CONFIG_PINCTRL_APQ8064 is not set
> CONFIG_PINCTRL_APQ8084=y
> CONFIG_PINCTRL_IPQ4019=m
> CONFIG_PINCTRL_IPQ8064=y
> CONFIG_PINCTRL_IPQ8074=y
> CONFIG_PINCTRL_IPQ6018=m
> CONFIG_PINCTRL_MSM8660=m
> # CONFIG_PINCTRL_MSM8960 is not set
> CONFIG_PINCTRL_MDM9615=y
> CONFIG_PINCTRL_MSM8X74=m
> CONFIG_PINCTRL_MSM8916=m
> CONFIG_PINCTRL_MSM8976=y
> # CONFIG_PINCTRL_MSM8994 is not set
> CONFIG_PINCTRL_MSM8996=y
> CONFIG_PINCTRL_MSM8998=m
> # CONFIG_PINCTRL_QCS404 is not set
> CONFIG_PINCTRL_QCOM_SPMI_PMIC=m
> CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
> # CONFIG_PINCTRL_SC7180 is not set
> CONFIG_PINCTRL_SDM660=m
> # CONFIG_PINCTRL_SDM845 is not set
> CONFIG_PINCTRL_SM8150=y
> CONFIG_PINCTRL_SAMSUNG=y
> # CONFIG_PINCTRL_EXYNOS is not set
> # CONFIG_PINCTRL_S3C24XX is not set
> CONFIG_PINCTRL_S3C64XX=y
> CONFIG_PINCTRL_SH_PFC=y
> CONFIG_PINCTRL_SH_PFC_GPIO=y
> CONFIG_PINCTRL_SH_FUNC_GPIO=y
> CONFIG_PINCTRL_PFC_EMEV2=y
> CONFIG_PINCTRL_PFC_R8A73A4=y
> # CONFIG_PINCTRL_PFC_R8A7740 is not set
> # CONFIG_PINCTRL_PFC_R8A7743 is not set
> CONFIG_PINCTRL_PFC_R8A7744=y
> # CONFIG_PINCTRL_PFC_R8A7745 is not set
> # CONFIG_PINCTRL_PFC_R8A77470 is not set
> # CONFIG_PINCTRL_PFC_R8A774A1 is not set
> CONFIG_PINCTRL_PFC_R8A774B1=y
> # CONFIG_PINCTRL_PFC_R8A774C0 is not set
> CONFIG_PINCTRL_PFC_R8A7778=y
> CONFIG_PINCTRL_PFC_R8A7779=y
> # CONFIG_PINCTRL_PFC_R8A7790 is not set
> # CONFIG_PINCTRL_PFC_R8A7791 is not set
> CONFIG_PINCTRL_PFC_R8A7792=y
> # CONFIG_PINCTRL_PFC_R8A7793 is not set
> CONFIG_PINCTRL_PFC_R8A7794=y
> CONFIG_PINCTRL_PFC_R8A77950=y
> CONFIG_PINCTRL_PFC_R8A77951=y
> # CONFIG_PINCTRL_PFC_R8A77960 is not set
> CONFIG_PINCTRL_PFC_R8A77961=y
> CONFIG_PINCTRL_PFC_R8A77965=y
> # CONFIG_PINCTRL_PFC_R8A77970 is not set
> CONFIG_PINCTRL_PFC_R8A77980=y
> # CONFIG_PINCTRL_PFC_R8A77990 is not set
> # CONFIG_PINCTRL_PFC_R8A77995 is not set
> CONFIG_PINCTRL_PFC_SH7203=y
> # CONFIG_PINCTRL_PFC_SH7264 is not set
> # CONFIG_PINCTRL_PFC_SH7269 is not set
> # CONFIG_PINCTRL_PFC_SH73A0 is not set
> CONFIG_PINCTRL_PFC_SH7720=y
> CONFIG_PINCTRL_PFC_SH7722=y
> # CONFIG_PINCTRL_PFC_SH7723 is not set
> # CONFIG_PINCTRL_PFC_SH7724 is not set
> # CONFIG_PINCTRL_PFC_SH7734 is not set
> # CONFIG_PINCTRL_PFC_SH7757 is not set
> CONFIG_PINCTRL_PFC_SH7785=y
> # CONFIG_PINCTRL_PFC_SH7786 is not set
> # CONFIG_PINCTRL_PFC_SHX3 is not set
> CONFIG_PINCTRL_SPRD=y
> CONFIG_PINCTRL_SPRD_SC9860=y
> CONFIG_PINCTRL_STM32=y
> CONFIG_PINCTRL_STM32F429=y
> CONFIG_PINCTRL_STM32F469=y
> CONFIG_PINCTRL_STM32F746=y
> # CONFIG_PINCTRL_STM32F769 is not set
> CONFIG_PINCTRL_STM32H743=y
> # CONFIG_PINCTRL_STM32MP157 is not set
> # CONFIG_PINCTRL_TI_IODELAY is not set
> # CONFIG_PINCTRL_UNIPHIER is not set
> 
> #
> # MediaTek pinctrl drivers
> #
> CONFIG_EINT_MTK=y
> CONFIG_PINCTRL_MTK=y
> CONFIG_PINCTRL_MTK_MOORE=y
> # CONFIG_PINCTRL_MT2701 is not set
> CONFIG_PINCTRL_MT7623=y
> CONFIG_PINCTRL_MT7629=y
> # CONFIG_PINCTRL_MT8135 is not set
> # CONFIG_PINCTRL_MT8127 is not set
> CONFIG_PINCTRL_MT2712=y
> # CONFIG_PINCTRL_MT6765 is not set
> # CONFIG_PINCTRL_MT6797 is not set
> CONFIG_PINCTRL_MT7622=y
> # CONFIG_PINCTRL_MT8173 is not set
> # CONFIG_PINCTRL_MT8183 is not set
> # CONFIG_PINCTRL_MT8516 is not set
> # CONFIG_PINCTRL_MT6397 is not set
> # end of MediaTek pinctrl drivers
> 
> CONFIG_PINCTRL_MADERA=y
> CONFIG_PINCTRL_CS47L15=y
> CONFIG_PINCTRL_CS47L85=y
> CONFIG_PINCTRL_CS47L90=y
> CONFIG_PINCTRL_CS47L92=y
> CONFIG_PINCTRL_EQUILIBRIUM=m
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_OF_GPIO=y
> CONFIG_GPIOLIB_IRQCHIP=y
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=y
> CONFIG_GPIO_GENERIC=y
> CONFIG_GPIO_MAX730X=y
> 
> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=m
> CONFIG_GPIO_ALTERA=m
> # CONFIG_GPIO_ASPEED is not set
> # CONFIG_GPIO_ASPEED_SGPIO is not set
> CONFIG_GPIO_ATH79=m
> # CONFIG_GPIO_RASPBERRYPI_EXP is not set
> # CONFIG_GPIO_BCM_KONA is not set
> # CONFIG_GPIO_BCM_XGS_IPROC is not set
> # CONFIG_GPIO_BRCMSTB is not set
> CONFIG_GPIO_CADENCE=y
> CONFIG_GPIO_CLPS711X=m
> # CONFIG_GPIO_DWAPB is not set
> CONFIG_GPIO_EIC_SPRD=y
> CONFIG_GPIO_EM=y
> # CONFIG_GPIO_FTGPIO010 is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=y
> CONFIG_GPIO_HLWD=m
> CONFIG_GPIO_ICH=m
> CONFIG_GPIO_IOP=y
> # CONFIG_GPIO_LOGICVC is not set
> CONFIG_GPIO_LPC18XX=y
> # CONFIG_GPIO_LPC32XX is not set
> # CONFIG_GPIO_MB86S7X is not set
> # CONFIG_GPIO_MPC8XXX is not set
> # CONFIG_GPIO_MT7621 is not set
> CONFIG_GPIO_MXC=y
> CONFIG_GPIO_MXS=y
> CONFIG_GPIO_PMIC_EIC_SPRD=y
> # CONFIG_GPIO_RCAR is not set
> CONFIG_GPIO_RDA=y
> CONFIG_GPIO_SAMA5D2_PIOBU=y
> CONFIG_GPIO_SIFIVE=y
> CONFIG_GPIO_SIOX=m
> # CONFIG_GPIO_SNPS_CREG is not set
> # CONFIG_GPIO_SPRD is not set
> # CONFIG_GPIO_STP_XWAY is not set
> CONFIG_GPIO_SYSCON=y
> # CONFIG_GPIO_TEGRA is not set
> CONFIG_GPIO_TEGRA186=y
> CONFIG_GPIO_TS4800=y
> CONFIG_GPIO_UNIPHIER=m
> CONFIG_GPIO_VX855=m
> CONFIG_GPIO_WCD934X=m
> # CONFIG_GPIO_XILINX is not set
> CONFIG_GPIO_XLP=y
> CONFIG_GPIO_ZX=y
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> 
> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_104_DIO_48E is not set
> # CONFIG_GPIO_104_IDIO_16 is not set
> CONFIG_GPIO_104_IDI_48=y
> CONFIG_GPIO_F7188X=y
> CONFIG_GPIO_GPIO_MM=y
> CONFIG_GPIO_IT87=m
> CONFIG_GPIO_SCH=m
> # CONFIG_GPIO_SCH311X is not set
> CONFIG_GPIO_TS5500=y
> CONFIG_GPIO_WINBOND=y
> CONFIG_GPIO_WS16C48=y
> # end of Port-mapped I/O GPIO drivers
> 
> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_GW_PLD=m
> CONFIG_GPIO_MAX7300=m
> CONFIG_GPIO_MAX732X=m
> CONFIG_GPIO_PCA953X=m
> CONFIG_GPIO_PCF857X=m
> CONFIG_GPIO_TPIC2810=m
> CONFIG_GPIO_TS4900=m
> # end of I2C GPIO expanders
> 
> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=y
> CONFIG_GPIO_BD9571MWV=m
> # CONFIG_GPIO_CS5535 is not set
> CONFIG_GPIO_JANZ_TTL=y
> CONFIG_GPIO_LP873X=m
> CONFIG_GPIO_LP87565=m
> # CONFIG_GPIO_MADERA is not set
> CONFIG_GPIO_MAX77650=m
> # CONFIG_GPIO_STMPE is not set
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS65218=m
> # CONFIG_GPIO_TPS65912 is not set
> # CONFIG_GPIO_TQMX86 is not set
> # CONFIG_GPIO_WM8994 is not set
> # end of MFD GPIO expanders
> 
> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> CONFIG_GPIO_BT8XX=m
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCH=m
> CONFIG_GPIO_PCI_IDIO_16=m
> CONFIG_GPIO_PCIE_IDIO_24=y
> # CONFIG_GPIO_RDC321X is not set
> # CONFIG_GPIO_SODAVILLE is not set
> # end of PCI GPIO expanders
> 
> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_74X164=y
> CONFIG_GPIO_MAX3191X=y
> CONFIG_GPIO_MAX7301=y
> CONFIG_GPIO_MC33880=y
> # CONFIG_GPIO_PISOSR is not set
> # CONFIG_GPIO_XRA1403 is not set
> CONFIG_GPIO_MOXTET=m
> # end of SPI GPIO expanders
> 
> #
> # USB GPIO expanders
> #
> CONFIG_GPIO_VIPERBOARD=y
> # end of USB GPIO expanders
> 
> CONFIG_GPIO_MOCKUP=y
> CONFIG_W1=y
> 
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=m
> CONFIG_W1_MASTER_DS2490=y
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_MXC=m
> CONFIG_W1_MASTER_DS1WM=m
> # CONFIG_W1_MASTER_GPIO is not set
> CONFIG_W1_MASTER_SGI=y
> # end of 1-wire Bus Masters
> 
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=m
> CONFIG_W1_SLAVE_SMEM=y
> CONFIG_W1_SLAVE_DS2405=y
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=m
> CONFIG_W1_SLAVE_DS2406=m
> CONFIG_W1_SLAVE_DS2423=y
> # CONFIG_W1_SLAVE_DS2805 is not set
> CONFIG_W1_SLAVE_DS2430=m
> CONFIG_W1_SLAVE_DS2431=y
> CONFIG_W1_SLAVE_DS2433=m
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=y
> CONFIG_W1_SLAVE_DS250X=y
> CONFIG_W1_SLAVE_DS2780=y
> CONFIG_W1_SLAVE_DS2781=m
> CONFIG_W1_SLAVE_DS28E04=y
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
> 
> CONFIG_POWER_AVS=y
> CONFIG_QCOM_CPR=m
> CONFIG_POWER_RESET=y
> # CONFIG_POWER_RESET_BRCMKONA is not set
> CONFIG_POWER_RESET_BRCMSTB=y
> CONFIG_POWER_RESET_GEMINI_POWEROFF=y
> # CONFIG_POWER_RESET_GPIO is not set
> CONFIG_POWER_RESET_GPIO_RESTART=y
> # CONFIG_POWER_RESET_OCELOT_RESET is not set
> # CONFIG_POWER_RESET_PIIX4_POWEROFF is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> CONFIG_POWER_RESET_MT6323=y
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_RESET_KEYSTONE=y
> # CONFIG_POWER_RESET_SYSCON is not set
> CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> CONFIG_POWER_RESET_RMOBILE=m
> CONFIG_POWER_RESET_ZX=m
> CONFIG_REBOOT_MODE=m
> CONFIG_SYSCON_REBOOT_MODE=m
> CONFIG_POWER_RESET_SC27XX=y
> # CONFIG_NVMEM_REBOOT_MODE is not set
> CONFIG_POWER_SUPPLY=y
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_POWER_SUPPLY_HWMON is not set
> # CONFIG_PDA_POWER is not set
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_TEST_POWER=y
> # CONFIG_CHARGER_ADP5061 is not set
> CONFIG_BATTERY_ACT8945A=m
> CONFIG_BATTERY_CPCAP=m
> # CONFIG_BATTERY_DS2760 is not set
> CONFIG_BATTERY_DS2780=y
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_LEGO_EV3=y
> CONFIG_BATTERY_INGENIC=m
> CONFIG_BATTERY_SBS=m
> CONFIG_CHARGER_SBS=m
> CONFIG_MANAGER_SBS=m
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_CHARGER_DA9150 is not set
> CONFIG_BATTERY_DA9150=m
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=m
> CONFIG_BATTERY_MAX1721X=y
> CONFIG_CHARGER_PCF50633=m
> # CONFIG_CHARGER_CPCAP is not set
> CONFIG_CHARGER_ISP1704=y
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=m
> # CONFIG_CHARGER_LT3651 is not set
> CONFIG_CHARGER_DETECTOR_MAX14656=m
> CONFIG_CHARGER_MAX77650=m
> # CONFIG_CHARGER_QCOM_SMBB is not set
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=m
> CONFIG_CHARGER_BQ24257=m
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ25890=m
> CONFIG_CHARGER_SMB347=m
> # CONFIG_CHARGER_TPS65217 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=m
> CONFIG_BATTERY_GOLDFISH=m
> # CONFIG_BATTERY_RT5033 is not set
> CONFIG_CHARGER_RT9455=m
> CONFIG_CHARGER_SC2731=y
> # CONFIG_FUEL_GAUGE_SC27XX is not set
> CONFIG_CHARGER_UCS1002=m
> CONFIG_HWMON=y
> CONFIG_HWMON_VID=y
> CONFIG_HWMON_DEBUG_CHIP=y
> 
> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7314 is not set
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=m
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=m
> CONFIG_SENSORS_ADM1026=m
> CONFIG_SENSORS_ADM1029=m
> CONFIG_SENSORS_ADM1031=m
> CONFIG_SENSORS_ADM1177=m
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=m
> CONFIG_SENSORS_ADT7310=m
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=m
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=m
> CONFIG_SENSORS_ADT7475=m
> CONFIG_SENSORS_AS370=m
> CONFIG_SENSORS_ASC7621=m
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=m
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> # CONFIG_SENSORS_ARM_SCMI is not set
> # CONFIG_SENSORS_ARM_SCPI is not set
> CONFIG_SENSORS_ASB100=m
> CONFIG_SENSORS_ASPEED=m
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=m
> CONFIG_SENSORS_DS1621=m
> CONFIG_SENSORS_DELL_SMM=y
> CONFIG_SENSORS_I5K_AMB=m
> CONFIG_SENSORS_F71805F=y
> CONFIG_SENSORS_F71882FG=m
> CONFIG_SENSORS_F75375S=m
> CONFIG_SENSORS_MC13783_ADC=m
> # CONFIG_SENSORS_FSCHMD is not set
> # CONFIG_SENSORS_FTSTEUTATES is not set
> # CONFIG_SENSORS_GL518SM is not set
> CONFIG_SENSORS_GL520SM=m
> CONFIG_SENSORS_G760A=m
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_GPIO_FAN=y
> CONFIG_SENSORS_HIH6130=m
> # CONFIG_SENSORS_IBMAEM is not set
> CONFIG_SENSORS_IBMPEX=m
> # CONFIG_SENSORS_IIO_HWMON is not set
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=m
> CONFIG_SENSORS_IT87=y
> CONFIG_SENSORS_JC42=m
> CONFIG_SENSORS_POWR1220=m
> CONFIG_SENSORS_LINEAGE=m
> CONFIG_SENSORS_LTC2945=m
> CONFIG_SENSORS_LTC2947=m
> CONFIG_SENSORS_LTC2947_I2C=m
> CONFIG_SENSORS_LTC2947_SPI=m
> CONFIG_SENSORS_LTC2990=m
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=m
> CONFIG_SENSORS_LTC4222=m
> CONFIG_SENSORS_LTC4245=m
> CONFIG_SENSORS_LTC4260=m
> CONFIG_SENSORS_LTC4261=m
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=m
> CONFIG_SENSORS_MAX1668=m
> CONFIG_SENSORS_MAX197=m
> CONFIG_SENSORS_MAX31722=m
> CONFIG_SENSORS_MAX31730=m
> CONFIG_SENSORS_MAX6621=m
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=m
> CONFIG_SENSORS_MAX6650=m
> CONFIG_SENSORS_MAX6697=m
> CONFIG_SENSORS_MAX31790=m
> CONFIG_SENSORS_MCP3021=m
> # CONFIG_SENSORS_MLXREG_FAN is not set
> CONFIG_SENSORS_TC654=m
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_ADCXX=m
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM70=y
> CONFIG_SENSORS_LM73=m
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=m
> CONFIG_SENSORS_LM78=m
> CONFIG_SENSORS_LM80=m
> CONFIG_SENSORS_LM83=m
> CONFIG_SENSORS_LM85=m
> CONFIG_SENSORS_LM87=m
> CONFIG_SENSORS_LM90=m
> CONFIG_SENSORS_LM92=m
> CONFIG_SENSORS_LM93=m
> CONFIG_SENSORS_LM95234=m
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=y
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> # CONFIG_SENSORS_NCT6683 is not set
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> CONFIG_SENSORS_NPCM7XX=y
> CONFIG_SENSORS_NSA320=y
> CONFIG_SENSORS_OCC_P8_I2C=m
> CONFIG_SENSORS_OCC=m
> CONFIG_SENSORS_PCF8591=m
> CONFIG_PMBUS=m
> CONFIG_SENSORS_PMBUS=m
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_BEL_PFE=m
> CONFIG_SENSORS_IBM_CFFPS=m
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> CONFIG_SENSORS_IR35221=m
> CONFIG_SENSORS_IR38064=m
> # CONFIG_SENSORS_IRPS5401 is not set
> CONFIG_SENSORS_ISL68137=m
> # CONFIG_SENSORS_LM25066 is not set
> # CONFIG_SENSORS_LTC2978 is not set
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=m
> CONFIG_SENSORS_MAX20730=m
> # CONFIG_SENSORS_MAX20751 is not set
> CONFIG_SENSORS_MAX31785=m
> CONFIG_SENSORS_MAX34440=m
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_PXE1610=m
> # CONFIG_SENSORS_TPS40422 is not set
> CONFIG_SENSORS_TPS53679=m
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=m
> CONFIG_SENSORS_XDPE122=m
> CONFIG_SENSORS_ZL6100=m
> CONFIG_SENSORS_PWM_FAN=y
> CONFIG_SENSORS_RASPBERRYPI_HWMON=y
> CONFIG_SENSORS_SHT15=y
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=m
> CONFIG_SENSORS_SHTC1=m
> CONFIG_SENSORS_SIS5595=y
> CONFIG_SENSORS_DME1737=m
> CONFIG_SENSORS_EMC1403=m
> CONFIG_SENSORS_EMC2103=m
> CONFIG_SENSORS_EMC6W201=m
> CONFIG_SENSORS_SMSC47M1=y
> CONFIG_SENSORS_SMSC47M192=m
> CONFIG_SENSORS_SMSC47B397=y
> # CONFIG_SENSORS_SCH5627 is not set
> # CONFIG_SENSORS_SCH5636 is not set
> CONFIG_SENSORS_STTS751=m
> CONFIG_SENSORS_SMM665=m
> CONFIG_SENSORS_ADC128D818=m
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=y
> CONFIG_SENSORS_AMC6821=m
> CONFIG_SENSORS_INA209=m
> CONFIG_SENSORS_INA2XX=m
> CONFIG_SENSORS_INA3221=m
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=m
> CONFIG_SENSORS_TMP102=m
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP108=m
> CONFIG_SENSORS_TMP401=m
> # CONFIG_SENSORS_TMP421 is not set
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=y
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=m
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=m
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=m
> CONFIG_SENSORS_W83795=m
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=m
> CONFIG_SENSORS_W83L786NG=m
> CONFIG_SENSORS_W83627HF=m
> CONFIG_SENSORS_W83627EHF=y
> CONFIG_THERMAL=y
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> CONFIG_THERMAL_HWMON=y
> # CONFIG_THERMAL_OF is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=y
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> CONFIG_CLOCK_THERMAL=y
> CONFIG_DEVFREQ_THERMAL=y
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_THERMAL_MMIO=y
> # CONFIG_HISI_THERMAL is not set
> CONFIG_IMX_THERMAL=y
> CONFIG_IMX_SC_THERMAL=m
> # CONFIG_SPEAR_THERMAL is not set
> CONFIG_SUN8I_THERMAL=y
> CONFIG_ROCKCHIP_THERMAL=y
> CONFIG_RCAR_THERMAL=y
> CONFIG_RCAR_GEN3_THERMAL=m
> # CONFIG_KIRKWOOD_THERMAL is not set
> # CONFIG_DOVE_THERMAL is not set
> CONFIG_ARMADA_THERMAL=y
> CONFIG_DA9062_THERMAL=y
> CONFIG_MTK_THERMAL=m
> 
> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_X86_PKG_TEMP_THERMAL is not set
> 
> #
> # ACPI INT340X thermal drivers
> #
> # end of ACPI INT340X thermal drivers
> 
> CONFIG_INTEL_PCH_THERMAL=y
> # end of Intel thermal drivers
> 
> #
> # Broadcom thermal drivers
> #
> CONFIG_BRCMSTB_THERMAL=m
> CONFIG_BCM_NS_THERMAL=y
> CONFIG_BCM_SR_THERMAL=y
> # end of Broadcom thermal drivers
> 
> #
> # Texas Instruments thermal drivers
> #
> CONFIG_TI_SOC_THERMAL=y
> CONFIG_TI_THERMAL=y
> CONFIG_OMAP3_THERMAL=y
> # CONFIG_OMAP4_THERMAL is not set
> CONFIG_OMAP5_THERMAL=y
> # CONFIG_DRA752_THERMAL is not set
> # end of Texas Instruments thermal drivers
> 
> #
> # Samsung thermal drivers
> #
> # end of Samsung thermal drivers
> 
> # CONFIG_TANGO_THERMAL is not set
> CONFIG_GENERIC_ADC_THERMAL=m
> 
> #
> # Qualcomm thermal drivers
> #
> CONFIG_QCOM_TSENS=m
> CONFIG_QCOM_SPMI_TEMP_ALARM=y
> # end of Qualcomm thermal drivers
> 
> CONFIG_ZX2967_THERMAL=m
> CONFIG_SPRD_THERMAL=y
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> CONFIG_WATCHDOG_NOWAYOUT=y
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> # CONFIG_WATCHDOG_SYSFS is not set
> 
> #
> # Watchdog Pretimeout Governors
> #
> CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=y
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=m
> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=y
> # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set
> 
> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=y
> # CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
> # CONFIG_DA9052_WATCHDOG is not set
> CONFIG_DA9055_WATCHDOG=y
> # CONFIG_DA9063_WATCHDOG is not set
> CONFIG_DA9062_WATCHDOG=m
> # CONFIG_GPIO_WATCHDOG is not set
> CONFIG_MENF21BMC_WATCHDOG=m
> # CONFIG_TANGOX_WATCHDOG is not set
> CONFIG_XILINX_WATCHDOG=y
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> CONFIG_RAVE_SP_WATCHDOG=m
> CONFIG_MLX_WDT=y
> CONFIG_ARMADA_37XX_WATCHDOG=y
> # CONFIG_ASM9260_WATCHDOG is not set
> CONFIG_AT91RM9200_WATCHDOG=y
> CONFIG_AT91SAM9X_WATCHDOG=y
> # CONFIG_SAMA5D4_WATCHDOG is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> CONFIG_FTWDT010_WATCHDOG=m
> CONFIG_S3C2410_WATCHDOG=m
> CONFIG_DW_WATCHDOG=y
> # CONFIG_EP93XX_WATCHDOG is not set
> CONFIG_OMAP_WATCHDOG=m
> CONFIG_PNX4008_WATCHDOG=y
> CONFIG_DAVINCI_WATCHDOG=m
> CONFIG_RN5T618_WATCHDOG=y
> # CONFIG_SUNXI_WATCHDOG is not set
> # CONFIG_NPCM7XX_WATCHDOG is not set
> CONFIG_STMP3XXX_RTC_WATCHDOG=m
> # CONFIG_TS4800_WATCHDOG is not set
> CONFIG_TS72XX_WATCHDOG=m
> CONFIG_MAX63XX_WATCHDOG=y
> CONFIG_MAX77620_WATCHDOG=m
> CONFIG_IMX2_WDT=y
> CONFIG_IMX7ULP_WDT=m
> CONFIG_RETU_WATCHDOG=m
> CONFIG_MOXART_WDT=m
> CONFIG_SIRFSOC_WATCHDOG=m
> # CONFIG_ST_LPC_WATCHDOG is not set
> # CONFIG_TEGRA_WATCHDOG is not set
> # CONFIG_QCOM_WDT is not set
> CONFIG_MESON_GXBB_WATCHDOG=m
> CONFIG_MESON_WATCHDOG=m
> # CONFIG_MEDIATEK_WATCHDOG is not set
> CONFIG_DIGICOLOR_WATCHDOG=m
> # CONFIG_LPC18XX_WATCHDOG is not set
> # CONFIG_ATLAS7_WATCHDOG is not set
> # CONFIG_RENESAS_WDT is not set
> CONFIG_RENESAS_RZAWDT=y
> # CONFIG_ASPEED_WATCHDOG is not set
> CONFIG_UNIPHIER_WATCHDOG=y
> CONFIG_RTD119X_WATCHDOG=y
> CONFIG_SPRD_WATCHDOG=y
> CONFIG_PM8916_WATCHDOG=y
> CONFIG_ACQUIRE_WDT=m
> CONFIG_ADVANTECH_WDT=m
> CONFIG_ALIM1535_WDT=m
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_EBC_C384_WDT=m
> CONFIG_F71808E_WDT=y
> CONFIG_SP5100_TCO=m
> CONFIG_GEODE_WDT=m
> CONFIG_SC520_WDT=y
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=m
> CONFIG_IBMASR=m
> # CONFIG_WAFER_WDT is not set
> # CONFIG_I6300ESB_WDT is not set
> CONFIG_IE6XX_WDT=y
> CONFIG_ITCO_WDT=m
> CONFIG_ITCO_VENDOR_SUPPORT=y
> CONFIG_IT8712F_WDT=m
> # CONFIG_IT87_WDT is not set
> CONFIG_HP_WATCHDOG=m
> CONFIG_HPWDT_NMI_DECODING=y
> CONFIG_SC1200_WDT=y
> CONFIG_SCx200_WDT=m
> CONFIG_PC87413_WDT=y
> # CONFIG_NV_TCO is not set
> CONFIG_RDC321X_WDT=m
> CONFIG_60XX_WDT=m
> CONFIG_SBC8360_WDT=m
> CONFIG_SBC7240_WDT=y
> CONFIG_CPU5_WDT=m
> # CONFIG_SMSC_SCH311X_WDT is not set
> CONFIG_SMSC37B787_WDT=y
> CONFIG_TQMX86_WDT=y
> CONFIG_VIA_WDT=m
> # CONFIG_W83627HF_WDT is not set
> # CONFIG_W83877F_WDT is not set
> # CONFIG_W83977F_WDT is not set
> # CONFIG_MACHZ_WDT is not set
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=m
> CONFIG_BCM47XX_WDT=y
> CONFIG_BCM2835_WDT=y
> CONFIG_BCM_KONA_WDT=y
> # CONFIG_BCM_KONA_WDT_DEBUG is not set
> CONFIG_BCM7038_WDT=y
> CONFIG_IMGPDC_WDT=y
> # CONFIG_MPC5200_WDT is not set
> CONFIG_MV64X60_WDT=m
> CONFIG_MEN_A21_WDT=y
> CONFIG_UML_WATCHDOG=y
> 
> #
> # ISA-based Watchdog Cards
> #
> CONFIG_PCWATCHDOG=y
> CONFIG_MIXCOMWD=m
> # CONFIG_WDT is not set
> 
> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> CONFIG_WDTPCI=m
> 
> #
> # USB-based Watchdog Cards
> #
> CONFIG_USBPCWATCHDOG=y
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=y
> CONFIG_SSB_SPROM=y
> CONFIG_SSB_PCIHOST_POSSIBLE=y
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_HOST_SOC=y
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=y
> CONFIG_BCMA=y
> CONFIG_BCMA_HOST_PCI_POSSIBLE=y
> # CONFIG_BCMA_HOST_PCI is not set
> # CONFIG_BCMA_HOST_SOC is not set
> # CONFIG_BCMA_DRIVER_PCI is not set
> CONFIG_BCMA_DRIVER_MIPS=y
> CONFIG_BCMA_PFLASH=y
> CONFIG_BCMA_NFLASH=y
> CONFIG_BCMA_DRIVER_GMAC_CMN=y
> CONFIG_BCMA_DRIVER_GPIO=y
> # CONFIG_BCMA_DEBUG is not set
> 
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=y
> CONFIG_MFD_CS5535=y
> CONFIG_MFD_ACT8945A=m
> # CONFIG_MFD_SUN4I_GPADC is not set
> # CONFIG_MFD_AT91_USART is not set
> CONFIG_MFD_ATMEL_FLEXCOM=y
> # CONFIG_MFD_ATMEL_HLCDC is not set
> CONFIG_MFD_BCM590XX=m
> CONFIG_MFD_BD9571MWV=m
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_MADERA=y
> CONFIG_MFD_MADERA_I2C=m
> CONFIG_MFD_MADERA_SPI=y
> CONFIG_MFD_CS47L15=y
> # CONFIG_MFD_CS47L35 is not set
> CONFIG_MFD_CS47L85=y
> CONFIG_MFD_CS47L90=y
> CONFIG_MFD_CS47L92=y
> # CONFIG_MFD_DA9052_SPI is not set
> CONFIG_MFD_DA9062=m
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=m
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_EXYNOS_LPASS=y
> CONFIG_MFD_MC13XXX=y
> CONFIG_MFD_MC13XXX_SPI=y
> CONFIG_MFD_MC13XXX_I2C=m
> CONFIG_MFD_MXS_LRADC=m
> CONFIG_MFD_MX25_TSADC=m
> CONFIG_MFD_HI6421_PMIC=m
> CONFIG_MFD_HI655X_PMIC=m
> # CONFIG_HTC_PASIC3 is not set
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
> CONFIG_LPC_ICH=m
> CONFIG_LPC_SCH=y
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> CONFIG_MFD_IQS62X=m
> CONFIG_MFD_JANZ_CMODIO=y
> # CONFIG_MFD_KEMPLD is not set
> CONFIG_MFD_88PM800=m
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77650=m
> CONFIG_MFD_MAX77686=m
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MT6397=m
> CONFIG_MFD_MENF21BMC=m
> CONFIG_EZX_PCAP=y
> CONFIG_MFD_CPCAP=y
> CONFIG_MFD_VIPERBOARD=y
> CONFIG_MFD_RETU=m
> CONFIG_MFD_PCF50633=m
> CONFIG_PCF50633_ADC=m
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_UCB1400_CORE is not set
> CONFIG_MFD_PM8XXX=m
> CONFIG_MFD_SPMI_PMIC=y
> CONFIG_MFD_RDC321X=m
> CONFIG_MFD_RT5033=m
> CONFIG_MFD_RK808=m
> CONFIG_MFD_RN5T618=m
> CONFIG_MFD_SI476X_CORE=m
> CONFIG_MFD_SM501=m
> CONFIG_MFD_SM501_GPIO=y
> CONFIG_MFD_SKY81452=m
> CONFIG_MFD_SC27XX_PMIC=m
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_STMPE=y
> 
> #
> # STMicroelectronics STMPE Interface Drivers
> #
> CONFIG_STMPE_SPI=y
> # end of STMicroelectronics STMPE Interface Drivers
> 
> # CONFIG_MFD_SUN6I_PRCM is not set
> CONFIG_MFD_SYSCON=y
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_TPS6105X is not set
> CONFIG_TPS65010=m
> # CONFIG_TPS6507X is not set
> CONFIG_MFD_TPS65086=m
> CONFIG_MFD_TPS65217=m
> CONFIG_MFD_TI_LP873X=m
> CONFIG_MFD_TI_LP87565=m
> CONFIG_MFD_TPS65218=m
> CONFIG_MFD_TPS65912=y
> CONFIG_MFD_TPS65912_I2C=m
> CONFIG_MFD_TPS65912_SPI=y
> CONFIG_MFD_WL1273_CORE=m
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=y
> CONFIG_MFD_ARIZONA=y
> CONFIG_MFD_ARIZONA_I2C=m
> CONFIG_MFD_ARIZONA_SPI=m
> # CONFIG_MFD_CS47L24 is not set
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=y
> # CONFIG_MFD_WM831X_SPI is not set
> CONFIG_MFD_WM8994=m
> # CONFIG_MFD_STW481X is not set
> # CONFIG_MFD_STM32_LPTIMER is not set
> CONFIG_MFD_STM32_TIMERS=m
> CONFIG_MFD_STMFX=m
> CONFIG_MFD_WCD934X=m
> CONFIG_RAVE_SP_CORE=m
> # end of Multifunction device drivers
> 
> CONFIG_REGULATOR=y
> CONFIG_REGULATOR_DEBUG=y
> # CONFIG_REGULATOR_FIXED_VOLTAGE is not set
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
> CONFIG_REGULATOR_USERSPACE_CONSUMER=m
> CONFIG_REGULATOR_88PG86X=m
> CONFIG_REGULATOR_88PM800=m
> CONFIG_REGULATOR_ACT8865=m
> # CONFIG_REGULATOR_ACT8945A is not set
> CONFIG_REGULATOR_AD5398=m
> CONFIG_REGULATOR_ANATOP=m
> CONFIG_REGULATOR_ARIZONA_LDO1=m
> CONFIG_REGULATOR_ARIZONA_MICSUPP=m
> CONFIG_REGULATOR_BCM590XX=m
> CONFIG_REGULATOR_BD9571MWV=m
> CONFIG_REGULATOR_CPCAP=y
> CONFIG_REGULATOR_DA9062=m
> CONFIG_REGULATOR_DA9210=m
> CONFIG_REGULATOR_DA9211=m
> CONFIG_REGULATOR_FAN53555=m
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_HI6421=m
> CONFIG_REGULATOR_HI6421V530=m
> # CONFIG_REGULATOR_HI655X is not set
> CONFIG_REGULATOR_ISL9305=m
> CONFIG_REGULATOR_ISL6271A=m
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=m
> CONFIG_REGULATOR_LP872X=m
> CONFIG_REGULATOR_LP873X=m
> # CONFIG_REGULATOR_LP8755 is not set
> # CONFIG_REGULATOR_LP87565 is not set
> CONFIG_REGULATOR_LTC3589=m
> # CONFIG_REGULATOR_LTC3676 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> # CONFIG_REGULATOR_MAX77650 is not set
> CONFIG_REGULATOR_MAX8649=m
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8952=m
> CONFIG_REGULATOR_MAX77686=m
> CONFIG_REGULATOR_MAX77802=m
> CONFIG_REGULATOR_MC13XXX_CORE=m
> CONFIG_REGULATOR_MC13783=m
> # CONFIG_REGULATOR_MC13892 is not set
> # CONFIG_REGULATOR_MCP16502 is not set
> # CONFIG_REGULATOR_MP5416 is not set
> CONFIG_REGULATOR_MP8859=m
> CONFIG_REGULATOR_MPQ7920=m
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_MT6323=m
> # CONFIG_REGULATOR_MT6380 is not set
> CONFIG_REGULATOR_MT6397=m
> # CONFIG_REGULATOR_PBIAS is not set
> CONFIG_REGULATOR_PCAP=y
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PFUZE100=m
> CONFIG_REGULATOR_PV88060=m
> # CONFIG_REGULATOR_PV88080 is not set
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_PWM=y
> # CONFIG_REGULATOR_QCOM_RPMH is not set
> CONFIG_REGULATOR_QCOM_SPMI=y
> CONFIG_REGULATOR_RK808=m
> # CONFIG_REGULATOR_RN5T618 is not set
> # CONFIG_REGULATOR_RT5033 is not set
> CONFIG_REGULATOR_SC2731=m
> # CONFIG_REGULATOR_SKY81452 is not set
> # CONFIG_REGULATOR_SLG51000 is not set
> CONFIG_REGULATOR_STM32_BOOSTER=y
> # CONFIG_REGULATOR_STM32_VREFBUF is not set
> # CONFIG_REGULATOR_STM32_PWR is not set
> # CONFIG_REGULATOR_STW481X_VMMC is not set
> CONFIG_REGULATOR_SY8106A=m
> CONFIG_REGULATOR_SY8824X=m
> CONFIG_REGULATOR_TPS51632=m
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=m
> CONFIG_REGULATOR_TPS6507X=m
> CONFIG_REGULATOR_TPS65086=m
> # CONFIG_REGULATOR_TPS65132 is not set
> # CONFIG_REGULATOR_TPS65217 is not set
> CONFIG_REGULATOR_TPS65218=m
> CONFIG_REGULATOR_TPS6524X=y
> CONFIG_REGULATOR_TPS65912=y
> CONFIG_REGULATOR_UNIPHIER=y
> CONFIG_REGULATOR_VCTRL=y
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_CEC_CORE=m
> CONFIG_CEC_NOTIFIER=y
> CONFIG_RC_CORE=y
> # CONFIG_RC_MAP is not set
> # CONFIG_LIRC is not set
> # CONFIG_RC_DECODERS is not set
> CONFIG_RC_DEVICES=y
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=y
> # CONFIG_IR_HIX5HD2 is not set
> # CONFIG_IR_IMON is not set
> CONFIG_IR_IMON_RAW=y
> CONFIG_IR_MCEUSB=m
> CONFIG_IR_ITE_CIR=m
> # CONFIG_IR_FINTEK is not set
> CONFIG_IR_MESON=y
> CONFIG_IR_MTK=y
> CONFIG_IR_NUVOTON=y
> CONFIG_IR_REDRAT3=m
> CONFIG_IR_STREAMZAP=m
> # CONFIG_IR_WINBOND_CIR is not set
> CONFIG_IR_IGORPLUGUSB=y
> CONFIG_IR_IGUANA=y
> # CONFIG_IR_TTUSBIR is not set
> CONFIG_IR_RX51=y
> # CONFIG_IR_IMG is not set
> # CONFIG_RC_LOOPBACK is not set
> CONFIG_IR_GPIO_CIR=m
> CONFIG_RC_ST=m
> CONFIG_IR_SUNXI=m
> CONFIG_IR_SERIAL=y
> # CONFIG_IR_SERIAL_TRANSMITTER is not set
> CONFIG_IR_SIR=y
> CONFIG_IR_TANGO=m
> CONFIG_RC_XBOX_DVD=y
> # CONFIG_IR_ZX is not set
> # CONFIG_MEDIA_SUPPORT is not set
> 
> #
> # Graphics support
> #
> CONFIG_AGP=y
> # CONFIG_AGP_ALI is not set
> # CONFIG_AGP_ATI is not set
> CONFIG_AGP_AMD=m
> CONFIG_AGP_AMD64=m
> # CONFIG_AGP_INTEL is not set
> CONFIG_AGP_NVIDIA=m
> # CONFIG_AGP_SIS is not set
> CONFIG_AGP_SWORKS=y
> CONFIG_AGP_VIA=y
> CONFIG_AGP_EFFICEON=m
> CONFIG_INTEL_GTT=m
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> CONFIG_IMX_IPUV3_CORE=m
> CONFIG_DRM=m
> CONFIG_DRM_MIPI_DBI=m
> CONFIG_DRM_MIPI_DSI=y
> CONFIG_DRM_DP_AUX_CHARDEV=y
> CONFIG_DRM_EXPORT_FOR_TESTS=y
> CONFIG_DRM_DEBUG_SELFTEST=m
> CONFIG_DRM_KMS_HELPER=m
> CONFIG_DRM_KMS_FB_HELPER=y
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_FBDEV_OVERALLOC=100
> CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM=y
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=m
> CONFIG_DRM_TTM_DMA_PAGE_POOL=y
> CONFIG_DRM_VRAM_HELPER=m
> CONFIG_DRM_TTM_HELPER=m
> CONFIG_DRM_GEM_CMA_HELPER=y
> CONFIG_DRM_KMS_CMA_HELPER=y
> CONFIG_DRM_GEM_SHMEM_HELPER=y
> CONFIG_DRM_SCHED=m
> 
> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_CH7006 is not set
> CONFIG_DRM_I2C_SIL164=m
> CONFIG_DRM_I2C_NXP_TDA998X=m
> CONFIG_DRM_I2C_NXP_TDA9950=m
> # end of I2C encoder or helper chips
> 
> #
> # ARM devices
> #
> # CONFIG_DRM_KOMEDA is not set
> # end of ARM devices
> 
> CONFIG_DRM_RADEON=m
> CONFIG_DRM_RADEON_USERPTR=y
> CONFIG_DRM_AMDGPU=m
> CONFIG_DRM_AMDGPU_SI=y
> CONFIG_DRM_AMDGPU_CIK=y
> # CONFIG_DRM_AMDGPU_USERPTR is not set
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=y
> 
> #
> # ACP (Audio CoProcessor) Configuration
> #
> CONFIG_DRM_AMD_ACP=y
> # end of ACP (Audio CoProcessor) Configuration
> 
> #
> # Display Engine Configuration
> #
> CONFIG_DRM_AMD_DC=y
> CONFIG_DRM_AMD_DC_DCN=y
> CONFIG_DRM_AMD_DC_HDCP=y
> # CONFIG_DEBUG_KERNEL_DC is not set
> # end of Display Engine Configuration
> 
> CONFIG_DRM_NOUVEAU=m
> # CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
> CONFIG_NOUVEAU_DEBUG=5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3
> CONFIG_NOUVEAU_DEBUG_MMU=y
> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> CONFIG_DRM_I915=m
> CONFIG_DRM_I915_FORCE_PROBE=""
> CONFIG_DRM_I915_CAPTURE_ERROR=y
> # CONFIG_DRM_I915_COMPRESS_ERROR is not set
> CONFIG_DRM_I915_USERPTR=y
> 
> #
> # drm/i915 Debugging
> #
> CONFIG_DRM_I915_DEBUG=y
> CONFIG_DRM_I915_DEBUG_MMIO=y
> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=y
> CONFIG_DRM_I915_SW_FENCE_CHECK_DAG=y
> CONFIG_DRM_I915_DEBUG_GUC=y
> CONFIG_DRM_I915_SELFTEST=y
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=y
> CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=y
> CONFIG_DRM_I915_DEBUG_RUNTIME_PM=y
> # end of drm/i915 Debugging
> 
> #
> # drm/i915 Profile Guided Optimisation
> #
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
> CONFIG_DRM_I915_STOP_TIMEOUT=100
> CONFIG_DRM_I915_TIMESLICE_DURATION=1
> # end of drm/i915 Profile Guided Optimisation
> 
> CONFIG_DRM_VGEM=m
> CONFIG_DRM_VKMS=m
> CONFIG_DRM_EXYNOS=m
> 
> #
> # CRTCs
> #
> # CONFIG_DRM_EXYNOS_FIMD is not set
> CONFIG_DRM_EXYNOS5433_DECON=y
> CONFIG_DRM_EXYNOS7_DECON=y
> CONFIG_DRM_EXYNOS_MIXER=y
> CONFIG_DRM_EXYNOS_VIDI=y
> 
> #
> # Encoders and Bridges
> #
> # CONFIG_DRM_EXYNOS_DSI is not set
> # CONFIG_DRM_EXYNOS_DP is not set
> CONFIG_DRM_EXYNOS_HDMI=y
> # CONFIG_DRM_EXYNOS_MIC is not set
> 
> #
> # Sub-drivers
> #
> CONFIG_DRM_EXYNOS_G2D=y
> CONFIG_DRM_EXYNOS_IPP=y
> CONFIG_DRM_EXYNOS_FIMC=y
> CONFIG_DRM_EXYNOS_ROTATOR=y
> CONFIG_DRM_EXYNOS_SCALER=y
> CONFIG_DRM_EXYNOS_GSC=y
> CONFIG_DRM_VMWGFX=m
> CONFIG_DRM_VMWGFX_FBCON=y
> # CONFIG_DRM_GMA500 is not set
> CONFIG_DRM_UDL=m
> CONFIG_DRM_AST=m
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_RCAR_DW_HDMI is not set
> CONFIG_DRM_RCAR_LVDS=m
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_VIRTIO_GPU=m
> CONFIG_DRM_PANEL=y
> 
> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_ARM_VERSATILE=m
> # CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
> CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
> CONFIG_DRM_PANEL_LVDS=m
> # CONFIG_DRM_PANEL_SIMPLE is not set
> CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=m
> CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
> CONFIG_DRM_PANEL_ILITEK_IL9322=m
> CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
> CONFIG_DRM_PANEL_INNOLUX_P079ZCA=m
> # CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
> # CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
> CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=m
> # CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
> # CONFIG_DRM_PANEL_LG_LB035Q02 is not set
> # CONFIG_DRM_PANEL_LG_LG4573 is not set
> # CONFIG_DRM_PANEL_NEC_NL8048HL11 is not set
> CONFIG_DRM_PANEL_NOVATEK_NT39016=m
> CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
> CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
> CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=m
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=m
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
> CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
> CONFIG_DRM_PANEL_ROCKTECH_JH057N00900=m
> CONFIG_DRM_PANEL_RONBO_RB070D30=m
> CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=m
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=m
> # CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=m
> CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=m
> CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
> CONFIG_DRM_PANEL_SEIKO_43WVF1G=m
> CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
> CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=m
> # CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
> # CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
> # CONFIG_DRM_PANEL_SONY_ACX424AKP is not set
> CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> # CONFIG_DRM_PANEL_TPO_TD043MTEA1 is not set
> CONFIG_DRM_PANEL_TPO_TPG110=m
> CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
> CONFIG_DRM_PANEL_XINPENG_XPP055C272=m
> # end of Display Panels
> 
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
> 
> #
> # Display Interface Bridges
> #
> CONFIG_DRM_CDNS_DSI=m
> CONFIG_DRM_DISPLAY_CONNECTOR=m
> CONFIG_DRM_LVDS_CODEC=m
> # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> CONFIG_DRM_NXP_PTN3460=m
> CONFIG_DRM_PARADE_PS8622=m
> # CONFIG_DRM_PARADE_PS8640 is not set
> CONFIG_DRM_SIL_SII8620=m
> CONFIG_DRM_SII902X=m
> CONFIG_DRM_SII9234=m
> CONFIG_DRM_SIMPLE_BRIDGE=m
> CONFIG_DRM_THINE_THC63LVD1024=m
> CONFIG_DRM_TOSHIBA_TC358764=m
> CONFIG_DRM_TOSHIBA_TC358767=m
> CONFIG_DRM_TOSHIBA_TC358768=m
> CONFIG_DRM_TI_TFP410=m
> CONFIG_DRM_TI_SN65DSI86=m
> CONFIG_DRM_TI_TPD12S015=m
> CONFIG_DRM_ANALOGIX_ANX6345=m
> CONFIG_DRM_ANALOGIX_ANX78XX=m
> CONFIG_DRM_ANALOGIX_DP=m
> # CONFIG_DRM_I2C_ADV7511 is not set
> # end of Display Interface Bridges
> 
> # CONFIG_DRM_IMX is not set
> # CONFIG_DRM_V3D is not set
> # CONFIG_DRM_VC4 is not set
> # CONFIG_DRM_ETNAVIV is not set
> CONFIG_DRM_ARCPGU=m
> CONFIG_DRM_MXS=y
> CONFIG_DRM_MXSFB=m
> # CONFIG_DRM_GM12U320 is not set
> CONFIG_TINYDRM_HX8357D=m
> CONFIG_TINYDRM_ILI9225=m
> CONFIG_TINYDRM_ILI9341=m
> # CONFIG_TINYDRM_ILI9486 is not set
> # CONFIG_TINYDRM_MI0283QT is not set
> CONFIG_TINYDRM_REPAPER=m
> CONFIG_TINYDRM_ST7586=m
> CONFIG_TINYDRM_ST7735R=m
> # CONFIG_DRM_PL111 is not set
> CONFIG_DRM_VBOXVIDEO=m
> # CONFIG_DRM_LIMA is not set
> CONFIG_DRM_PANFROST=m
> # CONFIG_DRM_ASPEED_GFX is not set
> CONFIG_DRM_TIDSS=m
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m
> CONFIG_DRM_LIB_RANDOM=y
> 
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> CONFIG_FB_NOTIFY=y
> CONFIG_FB=m
> CONFIG_FIRMWARE_EDID=y
> CONFIG_FB_DDC=m
> CONFIG_FB_CFB_FILLRECT=m
> CONFIG_FB_CFB_COPYAREA=m
> CONFIG_FB_CFB_IMAGEBLIT=m
> CONFIG_FB_SYS_FILLRECT=m
> CONFIG_FB_SYS_COPYAREA=m
> CONFIG_FB_SYS_IMAGEBLIT=m
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=m
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_SVGALIB=m
> CONFIG_FB_BACKLIGHT=m
> CONFIG_FB_MODE_HELPERS=y
> CONFIG_FB_TILEBLITTING=y
> 
> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> CONFIG_FB_PM2=m
> CONFIG_FB_PM2_FIFO_DISCONNECT=y
> CONFIG_FB_CLPS711X=m
> # CONFIG_FB_IMX is not set
> CONFIG_FB_CYBER2000=m
> # CONFIG_FB_CYBER2000_DDC is not set
> # CONFIG_FB_ARC is not set
> CONFIG_FB_VGA16=m
> # CONFIG_FB_N411 is not set
> CONFIG_FB_HGA=m
> CONFIG_FB_PVR2=m
> # CONFIG_FB_OPENCORES is not set
> CONFIG_FB_S1D13XXX=m
> CONFIG_FB_ATMEL=m
> CONFIG_FB_NVIDIA=m
> CONFIG_FB_NVIDIA_I2C=y
> CONFIG_FB_NVIDIA_DEBUG=y
> CONFIG_FB_NVIDIA_BACKLIGHT=y
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> CONFIG_FB_LE80578=m
> # CONFIG_FB_CARILLO_RANCH is not set
> CONFIG_FB_MATROX=m
> # CONFIG_FB_MATROX_MILLENIUM is not set
> # CONFIG_FB_MATROX_MYSTIQUE is not set
> # CONFIG_FB_MATROX_G is not set
> CONFIG_FB_MATROX_I2C=m
> CONFIG_FB_RADEON=m
> # CONFIG_FB_RADEON_I2C is not set
> CONFIG_FB_RADEON_BACKLIGHT=y
> CONFIG_FB_RADEON_DEBUG=y
> # CONFIG_FB_ATY128 is not set
> CONFIG_FB_ATY=m
> CONFIG_FB_ATY_CT=y
> CONFIG_FB_ATY_GENERIC_LCD=y
> CONFIG_FB_ATY_GX=y
> # CONFIG_FB_ATY_BACKLIGHT is not set
> CONFIG_FB_S3=m
> CONFIG_FB_S3_DDC=y
> CONFIG_FB_SAVAGE=m
> CONFIG_FB_SAVAGE_I2C=y
> CONFIG_FB_SAVAGE_ACCEL=y
> # CONFIG_FB_SIS is not set
> CONFIG_FB_VIA=m
> # CONFIG_FB_VIA_DIRECT_PROCFS is not set
> # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> CONFIG_FB_VOODOO1=m
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=m
> CONFIG_FB_ARK=m
> # CONFIG_FB_PM3 is not set
> CONFIG_FB_CARMINE=m
> CONFIG_FB_CARMINE_DRAM_EVAL=y
> # CONFIG_CARMINE_DRAM_CUSTOM is not set
> CONFIG_FB_GEODE=y
> # CONFIG_FB_GEODE_LX is not set
> CONFIG_FB_GEODE_GX=m
> CONFIG_FB_GEODE_GX1=m
> CONFIG_FB_PXA168=m
> CONFIG_FB_TMIO=m
> # CONFIG_FB_TMIO_ACCELL is not set
> # CONFIG_FB_S3C is not set
> # CONFIG_FB_SM501 is not set
> CONFIG_FB_SMSCUFX=m
> # CONFIG_FB_UDL is not set
> CONFIG_FB_IBM_GXT4500=m
> CONFIG_FB_GOLDFISH=m
> # CONFIG_FB_DA8XX is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> CONFIG_FB_MB862XX=m
> CONFIG_FB_MB862XX_PCI_GDC=y
> # CONFIG_FB_MB862XX_I2C is not set
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_SSD1307=m
> CONFIG_FB_SM712=m
> CONFIG_FB_OMAP2=m
> CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
> CONFIG_FB_OMAP2_NUM_FBS=3
> CONFIG_FB_OMAP2_DSS_INIT=y
> CONFIG_FB_OMAP2_DSS=m
> CONFIG_FB_OMAP2_DSS_DEBUG=y
> CONFIG_FB_OMAP2_DSS_DEBUGFS=y
> CONFIG_FB_OMAP2_DSS_COLLECT_IRQ_STATS=y
> CONFIG_FB_OMAP2_DSS_DPI=y
> CONFIG_FB_OMAP2_DSS_VENC=y
> # CONFIG_FB_OMAP4_DSS_HDMI is not set
> # CONFIG_FB_OMAP5_DSS_HDMI is not set
> CONFIG_FB_OMAP2_DSS_SDI=y
> CONFIG_FB_OMAP2_DSS_DSI=y
> CONFIG_FB_OMAP2_DSS_MIN_FCK_PER_PCK=0
> CONFIG_FB_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y
> 
> #
> # OMAPFB Panel and Encoder Drivers
> #
> # CONFIG_FB_OMAP2_ENCODER_OPA362 is not set
> # CONFIG_FB_OMAP2_ENCODER_TFP410 is not set
> CONFIG_FB_OMAP2_ENCODER_TPD12S015=m
> CONFIG_FB_OMAP2_CONNECTOR_DVI=m
> CONFIG_FB_OMAP2_CONNECTOR_HDMI=m
> CONFIG_FB_OMAP2_CONNECTOR_ANALOG_TV=m
> CONFIG_FB_OMAP2_PANEL_DPI=m
> CONFIG_FB_OMAP2_PANEL_DSI_CM=m
> CONFIG_FB_OMAP2_PANEL_LGPHILIPS_LB035Q02=m
> CONFIG_FB_OMAP2_PANEL_TPO_TD043MTEA1=m
> CONFIG_FB_OMAP2_PANEL_NEC_NL8048HL11=m
> # end of OMAPFB Panel and Encoder Drivers
> 
> # CONFIG_MMP_DISP is not set
> # end of Frame buffer Devices
> 
> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=m
> CONFIG_LCD_L4F00242T03=m
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> CONFIG_LCD_ILI922X=m
> CONFIG_LCD_ILI9320=m
> CONFIG_LCD_TDO24M=m
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=m
> CONFIG_LCD_AMS369FG06=m
> # CONFIG_LCD_LMS501KF03 is not set
> CONFIG_LCD_HX8357=m
> # CONFIG_LCD_OTM3225A is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> CONFIG_BACKLIGHT_ATMEL_LCDC=y
> CONFIG_BACKLIGHT_GENERIC=y
> # CONFIG_BACKLIGHT_CARILLO_RANCH is not set
> CONFIG_BACKLIGHT_PWM=m
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> CONFIG_BACKLIGHT_SAHARA=y
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_PCF50633=m
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=m
> CONFIG_BACKLIGHT_SKY81452=m
> CONFIG_BACKLIGHT_TPS65217=m
> CONFIG_BACKLIGHT_GPIO=y
> CONFIG_BACKLIGHT_LV5207LP=m
> CONFIG_BACKLIGHT_BD6107=m
> CONFIG_BACKLIGHT_ARCXCNN=m
> CONFIG_BACKLIGHT_RAVE_SP=m
> CONFIG_BACKLIGHT_LED=m
> # end of Backlight & LCD device support
> 
> CONFIG_VGASTATE=m
> CONFIG_VIDEOMODE_HELPERS=y
> CONFIG_HDMI=y
> # CONFIG_LOGO is not set
> # end of Graphics support
> 
> CONFIG_SOUND=y
> CONFIG_SOUND_OSS_CORE=y
> CONFIG_SOUND_OSS_CORE_PRECLAIM=y
> CONFIG_SND=m
> CONFIG_SND_TIMER=m
> CONFIG_SND_PCM=m
> CONFIG_SND_PCM_ELD=y
> CONFIG_SND_PCM_IEC958=y
> CONFIG_SND_DMAENGINE_PCM=m
> CONFIG_SND_HWDEP=m
> CONFIG_SND_SEQ_DEVICE=m
> CONFIG_SND_RAWMIDI=m
> CONFIG_SND_COMPRESS_OFFLOAD=m
> CONFIG_SND_JACK=y
> CONFIG_SND_JACK_INPUT_DEV=y
> CONFIG_SND_OSSEMUL=y
> # CONFIG_SND_MIXER_OSS is not set
> CONFIG_SND_PCM_OSS=m
> CONFIG_SND_PCM_OSS_PLUGINS=y
> CONFIG_SND_PCM_TIMER=y
> CONFIG_SND_DYNAMIC_MINORS=y
> CONFIG_SND_MAX_CARDS=32
> # CONFIG_SND_SUPPORT_OLD_API is not set
> CONFIG_SND_VERBOSE_PRINTK=y
> CONFIG_SND_DEBUG=y
> CONFIG_SND_DEBUG_VERBOSE=y
> # CONFIG_SND_CTL_VALIDATION is not set
> CONFIG_SND_VMASTER=y
> CONFIG_SND_DMA_SGBUF=y
> CONFIG_SND_SEQUENCER=m
> CONFIG_SND_SEQ_DUMMY=m
> CONFIG_SND_SEQUENCER_OSS=m
> CONFIG_SND_SEQ_MIDI_EVENT=m
> CONFIG_SND_SEQ_MIDI=m
> CONFIG_SND_SEQ_VIRMIDI=m
> CONFIG_SND_MPU401_UART=m
> CONFIG_SND_AC97_CODEC=m
> CONFIG_SND_DRIVERS=y
> CONFIG_SND_DUMMY=m
> CONFIG_SND_ALOOP=m
> CONFIG_SND_VIRMIDI=m
> CONFIG_SND_MTPAV=m
> CONFIG_SND_SERIAL_U16550=m
> CONFIG_SND_MPU401=m
> CONFIG_SND_AC97_POWER_SAVE=y
> CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0
> # CONFIG_SND_ISA is not set
> # CONFIG_SND_PCI is not set
> 
> #
> # HD-Audio
> #
> CONFIG_SND_HDA=m
> CONFIG_SND_HDA_HWDEP=y
> CONFIG_SND_HDA_RECONFIG=y
> # CONFIG_SND_HDA_INPUT_BEEP is not set
> # CONFIG_SND_HDA_PATCH_LOADER is not set
> CONFIG_SND_HDA_CODEC_REALTEK=m
> CONFIG_SND_HDA_CODEC_ANALOG=m
> CONFIG_SND_HDA_CODEC_SIGMATEL=m
> # CONFIG_SND_HDA_CODEC_VIA is not set
> CONFIG_SND_HDA_CODEC_HDMI=m
> # CONFIG_SND_HDA_CODEC_CIRRUS is not set
> # CONFIG_SND_HDA_CODEC_CONEXANT is not set
> CONFIG_SND_HDA_CODEC_CA0110=m
> CONFIG_SND_HDA_CODEC_CA0132=m
> # CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
> CONFIG_SND_HDA_CODEC_CMEDIA=m
> CONFIG_SND_HDA_CODEC_SI3054=m
> CONFIG_SND_HDA_GENERIC=m
> CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
> # end of HD-Audio
> 
> CONFIG_SND_HDA_CORE=m
> CONFIG_SND_HDA_COMPONENT=y
> CONFIG_SND_HDA_I915=y
> CONFIG_SND_HDA_EXT_CORE=m
> CONFIG_SND_HDA_PREALLOC_SIZE=0
> CONFIG_SND_PXA2XX_LIB=m
> CONFIG_SND_SPI=y
> CONFIG_SND_AT73C213=m
> CONFIG_SND_AT73C213_TARGET_BITRATE=48000
> # CONFIG_SND_USB is not set
> # CONFIG_SND_FIREWIRE is not set
> # CONFIG_SND_PCMCIA is not set
> CONFIG_SND_SOC=m
> CONFIG_SND_SOC_AC97_BUS=y
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
> CONFIG_SND_SOC_COMPRESS=y
> CONFIG_SND_SOC_ADI=m
> CONFIG_SND_SOC_ADI_AXI_I2S=m
> # CONFIG_SND_SOC_ADI_AXI_SPDIF is not set
> CONFIG_SND_SOC_AMD_ACP=m
> # CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH is not set
> CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=m
> CONFIG_SND_SOC_AMD_ACP3x=m
> CONFIG_SND_ATMEL_SOC=m
> CONFIG_SND_ATMEL_SOC_PDC=y
> CONFIG_SND_ATMEL_SOC_DMA=y
> CONFIG_SND_ATMEL_SOC_SSC=m
> CONFIG_SND_ATMEL_SOC_SSC_PDC=m
> CONFIG_SND_ATMEL_SOC_SSC_DMA=m
> CONFIG_SND_AT91_SOC_SAM9G20_WM8731=m
> CONFIG_SND_ATMEL_SOC_WM8904=m
> CONFIG_SND_AT91_SOC_SAM9X5_WM8731=m
> CONFIG_SND_ATMEL_SOC_CLASSD=m
> # CONFIG_SND_ATMEL_SOC_PDMIC is not set
> CONFIG_SND_ATMEL_SOC_I2S=m
> CONFIG_SND_SOC_MIKROE_PROTO=m
> CONFIG_SND_MCHP_SOC_I2S_MCC=m
> CONFIG_SND_BCM2835_SOC_I2S=m
> CONFIG_SND_SOC_CYGNUS=m
> # CONFIG_SND_EP93XX_SOC is not set
> # CONFIG_SND_DESIGNWARE_I2S is not set
> 
> #
> # SoC Audio for Freescale CPUs
> #
> 
> #
> # Common SoC Audio options for Freescale CPUs:
> #
> CONFIG_SND_SOC_FSL_ASRC=m
> CONFIG_SND_SOC_FSL_SAI=m
> CONFIG_SND_SOC_FSL_MQS=m
> CONFIG_SND_SOC_FSL_AUDMIX=m
> # CONFIG_SND_SOC_FSL_SSI is not set
> CONFIG_SND_SOC_FSL_SPDIF=m
> CONFIG_SND_SOC_FSL_ESAI=m
> CONFIG_SND_SOC_FSL_MICFIL=m
> CONFIG_SND_SOC_IMX_AUDMUX=m
> # CONFIG_SND_IMX_SOC is not set
> # end of SoC Audio for Freescale CPUs
> 
> CONFIG_SND_I2S_HI6210_I2S=m
> CONFIG_SND_JZ4740_SOC_I2S=m
> CONFIG_SND_KIRKWOOD_SOC=m
> CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB=m
> CONFIG_SND_SOC_IMG=y
> # CONFIG_SND_SOC_IMG_I2S_IN is not set
> CONFIG_SND_SOC_IMG_I2S_OUT=m
> # CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
> # CONFIG_SND_SOC_IMG_SPDIF_IN is not set
> CONFIG_SND_SOC_IMG_SPDIF_OUT=m
> CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=m
> # CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
> # CONFIG_SND_SOC_MTK_BTCVSD is not set
> 
> #
> # ASoC support for Amlogic platforms
> #
> # CONFIG_SND_MESON_AIU is not set
> CONFIG_SND_MESON_AXG_FIFO=m
> CONFIG_SND_MESON_AXG_FRDDR=m
> CONFIG_SND_MESON_AXG_TODDR=m
> CONFIG_SND_MESON_AXG_TDM_FORMATTER=m
> CONFIG_SND_MESON_AXG_TDM_INTERFACE=m
> # CONFIG_SND_MESON_AXG_TDMIN is not set
> CONFIG_SND_MESON_AXG_TDMOUT=m
> CONFIG_SND_MESON_AXG_SOUND_CARD=m
> CONFIG_SND_MESON_AXG_SPDIFOUT=m
> # CONFIG_SND_MESON_AXG_SPDIFIN is not set
> CONFIG_SND_MESON_AXG_PDM=m
> CONFIG_SND_MESON_CARD_UTILS=m
> CONFIG_SND_MESON_CODEC_GLUE=m
> # CONFIG_SND_MESON_GX_SOUND_CARD is not set
> # CONFIG_SND_MESON_G12A_TOACODEC is not set
> CONFIG_SND_MESON_G12A_TOHDMITX=m
> # CONFIG_SND_SOC_MESON_T9015 is not set
> # end of ASoC support for Amlogic platforms
> 
> # CONFIG_SND_MXS_SOC is not set
> CONFIG_SND_PXA2XX_SOC=m
> CONFIG_SND_SOC_QCOM=m
> CONFIG_SND_SOC_LPASS_CPU=m
> CONFIG_SND_SOC_LPASS_PLATFORM=m
> CONFIG_SND_SOC_LPASS_IPQ806X=m
> CONFIG_SND_SOC_LPASS_APQ8016=m
> CONFIG_SND_SOC_STORM=m
> CONFIG_SND_SOC_APQ8016_SBC=m
> CONFIG_SND_SOC_QCOM_COMMON=m
> CONFIG_SND_SOC_QDSP6_COMMON=m
> CONFIG_SND_SOC_QDSP6_CORE=m
> CONFIG_SND_SOC_QDSP6_AFE=m
> CONFIG_SND_SOC_QDSP6_AFE_DAI=m
> CONFIG_SND_SOC_QDSP6_ADM=m
> CONFIG_SND_SOC_QDSP6_ROUTING=m
> CONFIG_SND_SOC_QDSP6_ASM=m
> CONFIG_SND_SOC_QDSP6_ASM_DAI=m
> CONFIG_SND_SOC_QDSP6=m
> CONFIG_SND_SOC_MSM8996=m
> CONFIG_SND_SOC_ROCKCHIP=m
> CONFIG_SND_SOC_ROCKCHIP_I2S=m
> CONFIG_SND_SOC_ROCKCHIP_PDM=m
> CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
> CONFIG_SND_SOC_ROCKCHIP_MAX98090=m
> CONFIG_SND_SOC_ROCKCHIP_RT5645=m
> CONFIG_SND_SOC_RK3288_HDMI_ANALOG=m
> CONFIG_SND_SOC_RK3399_GRU_SOUND=m
> # CONFIG_SND_SOC_SAMSUNG is not set
> 
> #
> # SoC Audio support for Renesas SoCs
> #
> CONFIG_SND_SOC_SH4_FSI=m
> CONFIG_SND_SOC_RCAR=m
> # end of SoC Audio support for Renesas SoCs
> 
> CONFIG_SND_SOC_SIRF=m
> # CONFIG_SND_SOC_SIRF_AUDIO is not set
> CONFIG_SND_SOC_SIRF_USP=m
> # CONFIG_SND_SOC_SOF_TOPLEVEL is not set
> # CONFIG_SND_SOC_SPRD is not set
> # CONFIG_SND_SOC_STI is not set
> 
> #
> # STMicroelectronics STM32 SOC audio support
> #
> CONFIG_SND_SOC_STM32_SAI=m
> CONFIG_SND_SOC_STM32_I2S=m
> # CONFIG_SND_SOC_STM32_SPDIFRX is not set
> # end of STMicroelectronics STM32 SOC audio support
> 
> #
> # Allwinner SoC Audio support
> #
> CONFIG_SND_SUN4I_CODEC=m
> CONFIG_SND_SUN8I_CODEC=m
> CONFIG_SND_SUN8I_CODEC_ANALOG=m
> CONFIG_SND_SUN50I_CODEC_ANALOG=m
> CONFIG_SND_SUN4I_I2S=m
> CONFIG_SND_SUN4I_SPDIF=m
> CONFIG_SND_SUN8I_ADDA_PR_REGMAP=m
> # end of Allwinner SoC Audio support
> 
> CONFIG_SND_SOC_TEGRA=m
> CONFIG_SND_SOC_TEGRA20_AC97=m
> CONFIG_SND_SOC_TEGRA20_DAS=m
> # CONFIG_SND_SOC_TEGRA20_I2S is not set
> CONFIG_SND_SOC_TEGRA20_SPDIF=m
> CONFIG_SND_SOC_TEGRA30_AHUB=m
> CONFIG_SND_SOC_TEGRA30_I2S=m
> CONFIG_SND_SOC_TEGRA_RT5640=m
> CONFIG_SND_SOC_TEGRA_WM8753=m
> CONFIG_SND_SOC_TEGRA_WM8903=m
> CONFIG_SND_SOC_TEGRA_WM9712=m
> # CONFIG_SND_SOC_TEGRA_TRIMSLICE is not set
> # CONFIG_SND_SOC_TEGRA_ALC5632 is not set
> CONFIG_SND_SOC_TEGRA_MAX98090=m
> CONFIG_SND_SOC_TEGRA_RT5677=m
> # CONFIG_SND_SOC_TEGRA_SGTL5000 is not set
> 
> #
> # Audio support for Texas Instruments SoCs
> #
> CONFIG_SND_SOC_TI_EDMA_PCM=m
> CONFIG_SND_SOC_TI_SDMA_PCM=m
> CONFIG_SND_SOC_TI_UDMA_PCM=m
> 
> #
> # Texas Instruments DAI support for:
> #
> CONFIG_SND_SOC_DAVINCI_ASP=m
> CONFIG_SND_SOC_DAVINCI_MCASP=m
> CONFIG_SND_SOC_DAVINCI_VCIF=m
> CONFIG_SND_SOC_OMAP_DMIC=m
> CONFIG_SND_SOC_OMAP_MCBSP=m
> # CONFIG_SND_SOC_OMAP_MCPDM is not set
> 
> #
> # Audio support for boards with Texas Instruments SoCs
> #
> CONFIG_SND_SOC_OMAP_HDMI=m
> # end of Audio support for Texas Instruments SoCs
> 
> CONFIG_SND_SOC_UNIPHIER=m
> CONFIG_SND_SOC_UNIPHIER_AIO=m
> CONFIG_SND_SOC_UNIPHIER_LD11=m
> CONFIG_SND_SOC_UNIPHIER_PXS2=m
> CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC=m
> CONFIG_SND_SOC_XILINX_I2S=m
> CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
> CONFIG_SND_SOC_XILINX_SPDIF=m
> # CONFIG_SND_SOC_XTFPGA_I2S is not set
> CONFIG_ZX_SPDIF=m
> CONFIG_ZX_I2S=m
> CONFIG_ZX_TDM=m
> CONFIG_SND_SOC_I2C_AND_SPI=m
> 
> #
> # CODEC drivers
> #
> CONFIG_SND_SOC_ALL_CODECS=m
> # CONFIG_SND_SOC_88PM860X is not set
> CONFIG_SND_SOC_ARIZONA=m
> CONFIG_SND_SOC_WM_HUBS=m
> CONFIG_SND_SOC_WM_ADSP=m
> # CONFIG_SND_SOC_AB8500_CODEC is not set
> CONFIG_SND_SOC_AC97_CODEC=m
> CONFIG_SND_SOC_AD1836=m
> CONFIG_SND_SOC_AD193X=m
> CONFIG_SND_SOC_AD193X_SPI=m
> CONFIG_SND_SOC_AD193X_I2C=m
> CONFIG_SND_SOC_AD1980=m
> CONFIG_SND_SOC_AD73311=m
> CONFIG_SND_SOC_ADAU_UTILS=m
> CONFIG_SND_SOC_ADAU1373=m
> CONFIG_SND_SOC_ADAU1701=m
> CONFIG_SND_SOC_ADAU17X1=m
> CONFIG_SND_SOC_ADAU1761=m
> CONFIG_SND_SOC_ADAU1761_I2C=m
> CONFIG_SND_SOC_ADAU1761_SPI=m
> CONFIG_SND_SOC_ADAU1781=m
> CONFIG_SND_SOC_ADAU1781_I2C=m
> CONFIG_SND_SOC_ADAU1781_SPI=m
> CONFIG_SND_SOC_ADAU1977=m
> CONFIG_SND_SOC_ADAU1977_SPI=m
> CONFIG_SND_SOC_ADAU1977_I2C=m
> # CONFIG_SND_SOC_ADAU7002 is not set
> CONFIG_SND_SOC_ADAU7118=m
> CONFIG_SND_SOC_ADAU7118_HW=m
> CONFIG_SND_SOC_ADAU7118_I2C=m
> CONFIG_SND_SOC_ADAV80X=m
> CONFIG_SND_SOC_ADAV801=m
> CONFIG_SND_SOC_ADAV803=m
> CONFIG_SND_SOC_ADS117X=m
> # CONFIG_SND_SOC_AK4104 is not set
> CONFIG_SND_SOC_AK4118=m
> CONFIG_SND_SOC_AK4458=m
> CONFIG_SND_SOC_AK4535=m
> CONFIG_SND_SOC_AK4554=m
> CONFIG_SND_SOC_AK4613=m
> CONFIG_SND_SOC_AK4641=m
> CONFIG_SND_SOC_AK4642=m
> CONFIG_SND_SOC_AK4671=m
> # CONFIG_SND_SOC_AK5386 is not set
> # CONFIG_SND_SOC_AK5558 is not set
> CONFIG_SND_SOC_ALC5623=m
> CONFIG_SND_SOC_ALC5632=m
> CONFIG_SND_SOC_BD28623=m
> CONFIG_SND_SOC_BT_SCO=m
> CONFIG_SND_SOC_CPCAP=m
> CONFIG_SND_SOC_CQ0093VC=m
> # CONFIG_SND_SOC_CROS_EC_CODEC is not set
> # CONFIG_SND_SOC_CS35L32 is not set
> # CONFIG_SND_SOC_CS35L33 is not set
> # CONFIG_SND_SOC_CS35L34 is not set
> CONFIG_SND_SOC_CS35L35=m
> CONFIG_SND_SOC_CS35L36=m
> CONFIG_SND_SOC_CS42L42=m
> CONFIG_SND_SOC_CS42L51=m
> CONFIG_SND_SOC_CS42L51_I2C=m
> CONFIG_SND_SOC_CS42L52=m
> # CONFIG_SND_SOC_CS42L56 is not set
> CONFIG_SND_SOC_CS42L73=m
> # CONFIG_SND_SOC_CS4265 is not set
> CONFIG_SND_SOC_CS4270=m
> CONFIG_SND_SOC_CS4271=m
> # CONFIG_SND_SOC_CS4271_I2C is not set
> CONFIG_SND_SOC_CS4271_SPI=m
> # CONFIG_SND_SOC_CS42XX8_I2C is not set
> # CONFIG_SND_SOC_CS43130 is not set
> CONFIG_SND_SOC_CS4341=m
> CONFIG_SND_SOC_CS4349=m
> CONFIG_SND_SOC_CS47L15=m
> # CONFIG_SND_SOC_CS47L24 is not set
> CONFIG_SND_SOC_CS47L35=m
> CONFIG_SND_SOC_CS47L85=m
> CONFIG_SND_SOC_CS47L90=m
> CONFIG_SND_SOC_CS47L92=m
> # CONFIG_SND_SOC_CS53L30 is not set
> # CONFIG_SND_SOC_CX20442 is not set
> # CONFIG_SND_SOC_CX2072X is not set
> CONFIG_SND_SOC_JZ4740_CODEC=m
> # CONFIG_SND_SOC_JZ4725B_CODEC is not set
> CONFIG_SND_SOC_JZ4770_CODEC=m
> CONFIG_SND_SOC_L3=m
> CONFIG_SND_SOC_DA7210=m
> CONFIG_SND_SOC_DA7213=m
> CONFIG_SND_SOC_DA7218=m
> CONFIG_SND_SOC_DA7219=m
> CONFIG_SND_SOC_DA732X=m
> CONFIG_SND_SOC_DA9055=m
> CONFIG_SND_SOC_DMIC=m
> CONFIG_SND_SOC_HDMI_CODEC=m
> CONFIG_SND_SOC_ES7134=m
> CONFIG_SND_SOC_ES7241=m
> CONFIG_SND_SOC_ES8316=m
> CONFIG_SND_SOC_ES8328=m
> CONFIG_SND_SOC_ES8328_I2C=m
> CONFIG_SND_SOC_ES8328_SPI=m
> CONFIG_SND_SOC_GTM601=m
> CONFIG_SND_SOC_HDAC_HDMI=m
> CONFIG_SND_SOC_HDAC_HDA=m
> CONFIG_SND_SOC_ICS43432=m
> CONFIG_SND_SOC_INNO_RK3036=m
> CONFIG_SND_SOC_ISABELLE=m
> CONFIG_SND_SOC_LM49453=m
> # CONFIG_SND_SOC_LOCHNAGAR_SC is not set
> CONFIG_SND_SOC_MADERA=m
> CONFIG_SND_SOC_MAX98088=m
> CONFIG_SND_SOC_MAX98090=m
> CONFIG_SND_SOC_MAX98095=m
> CONFIG_SND_SOC_MAX98357A=m
> CONFIG_SND_SOC_MAX98371=m
> # CONFIG_SND_SOC_MAX98504 is not set
> CONFIG_SND_SOC_MAX9867=m
> CONFIG_SND_SOC_MAX98925=m
> CONFIG_SND_SOC_MAX98926=m
> CONFIG_SND_SOC_MAX98927=m
> # CONFIG_SND_SOC_MAX98373 is not set
> CONFIG_SND_SOC_MAX9850=m
> # CONFIG_SND_SOC_MAX9860 is not set
> CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
> CONFIG_SND_SOC_PCM1681=m
> CONFIG_SND_SOC_PCM1789=m
> CONFIG_SND_SOC_PCM1789_I2C=m
> # CONFIG_SND_SOC_PCM179X_I2C is not set
> # CONFIG_SND_SOC_PCM179X_SPI is not set
> CONFIG_SND_SOC_PCM186X=m
> # CONFIG_SND_SOC_PCM186X_I2C is not set
> CONFIG_SND_SOC_PCM186X_SPI=m
> CONFIG_SND_SOC_PCM3008=m
> # CONFIG_SND_SOC_PCM3060_I2C is not set
> # CONFIG_SND_SOC_PCM3060_SPI is not set
> CONFIG_SND_SOC_PCM3168A=m
> CONFIG_SND_SOC_PCM3168A_I2C=m
> CONFIG_SND_SOC_PCM3168A_SPI=m
> CONFIG_SND_SOC_PCM5102A=m
> CONFIG_SND_SOC_PCM512x=m
> CONFIG_SND_SOC_PCM512x_I2C=m
> CONFIG_SND_SOC_PCM512x_SPI=m
> # CONFIG_SND_SOC_RK3328 is not set
> CONFIG_SND_SOC_RL6231=m
> CONFIG_SND_SOC_RL6347A=m
> CONFIG_SND_SOC_RT274=m
> CONFIG_SND_SOC_RT286=m
> CONFIG_SND_SOC_RT298=m
> CONFIG_SND_SOC_RT1011=m
> CONFIG_SND_SOC_RT1015=m
> CONFIG_SND_SOC_RT1305=m
> CONFIG_SND_SOC_RT1308=m
> # CONFIG_SND_SOC_RT1308_SDW is not set
> CONFIG_SND_SOC_RT5514=m
> CONFIG_SND_SOC_RT5514_SPI=m
> # CONFIG_SND_SOC_RT5616 is not set
> CONFIG_SND_SOC_RT5631=m
> CONFIG_SND_SOC_RT5640=m
> CONFIG_SND_SOC_RT5645=m
> CONFIG_SND_SOC_RT5651=m
> CONFIG_SND_SOC_RT5659=m
> CONFIG_SND_SOC_RT5660=m
> CONFIG_SND_SOC_RT5663=m
> CONFIG_SND_SOC_RT5665=m
> CONFIG_SND_SOC_RT5668=m
> CONFIG_SND_SOC_RT5670=m
> CONFIG_SND_SOC_RT5677=m
> CONFIG_SND_SOC_RT5677_SPI=m
> CONFIG_SND_SOC_RT5682=m
> CONFIG_SND_SOC_RT5682_SDW=m
> # CONFIG_SND_SOC_RT700_SDW is not set
> CONFIG_SND_SOC_RT711=m
> CONFIG_SND_SOC_RT711_SDW=m
> CONFIG_SND_SOC_RT715=m
> CONFIG_SND_SOC_RT715_SDW=m
> CONFIG_SND_SOC_SGTL5000=m
> CONFIG_SND_SOC_SI476X=m
> CONFIG_SND_SOC_SIGMADSP=m
> CONFIG_SND_SOC_SIGMADSP_I2C=m
> CONFIG_SND_SOC_SIGMADSP_REGMAP=m
> # CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
> CONFIG_SND_SOC_SIRF_AUDIO_CODEC=m
> CONFIG_SND_SOC_SPDIF=m
> # CONFIG_SND_SOC_SSM2305 is not set
> CONFIG_SND_SOC_SSM2518=m
> CONFIG_SND_SOC_SSM2602=m
> CONFIG_SND_SOC_SSM2602_SPI=m
> # CONFIG_SND_SOC_SSM2602_I2C is not set
> CONFIG_SND_SOC_SSM4567=m
> # CONFIG_SND_SOC_STA32X is not set
> # CONFIG_SND_SOC_STA350 is not set
> CONFIG_SND_SOC_STA529=m
> CONFIG_SND_SOC_STAC9766=m
> # CONFIG_SND_SOC_STI_SAS is not set
> # CONFIG_SND_SOC_TAS2552 is not set
> # CONFIG_SND_SOC_TAS2562 is not set
> CONFIG_SND_SOC_TAS2770=m
> # CONFIG_SND_SOC_TAS5086 is not set
> # CONFIG_SND_SOC_TAS571X is not set
> CONFIG_SND_SOC_TAS5720=m
> CONFIG_SND_SOC_TAS6424=m
> CONFIG_SND_SOC_TDA7419=m
> # CONFIG_SND_SOC_TFA9879 is not set
> # CONFIG_SND_SOC_TLV320AIC23_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC23_SPI is not set
> CONFIG_SND_SOC_TLV320AIC26=m
> # CONFIG_SND_SOC_TLV320AIC31XX is not set
> # CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
> CONFIG_SND_SOC_TLV320AIC3X=m
> CONFIG_SND_SOC_TLV320DAC33=m
> CONFIG_SND_SOC_TLV320ADCX140=m
> CONFIG_SND_SOC_TS3A227E=m
> # CONFIG_SND_SOC_TSCS42XX is not set
> CONFIG_SND_SOC_TSCS454=m
> # CONFIG_SND_SOC_TWL4030 is not set
> # CONFIG_SND_SOC_TWL6040 is not set
> CONFIG_SND_SOC_UDA1334=m
> CONFIG_SND_SOC_UDA134X=m
> CONFIG_SND_SOC_UDA1380=m
> CONFIG_SND_SOC_WCD9335=m
> CONFIG_SND_SOC_WCD934X=m
> CONFIG_SND_SOC_WL1273=m
> CONFIG_SND_SOC_WM0010=m
> CONFIG_SND_SOC_WM1250_EV1=m
> CONFIG_SND_SOC_WM2000=m
> CONFIG_SND_SOC_WM2200=m
> CONFIG_SND_SOC_WM5100=m
> # CONFIG_SND_SOC_WM5102 is not set
> # CONFIG_SND_SOC_WM5110 is not set
> # CONFIG_SND_SOC_WM8350 is not set
> # CONFIG_SND_SOC_WM8400 is not set
> CONFIG_SND_SOC_WM8510=m
> # CONFIG_SND_SOC_WM8523 is not set
> CONFIG_SND_SOC_WM8524=m
> CONFIG_SND_SOC_WM8580=m
> CONFIG_SND_SOC_WM8711=m
> CONFIG_SND_SOC_WM8727=m
> CONFIG_SND_SOC_WM8728=m
> CONFIG_SND_SOC_WM8731=m
> # CONFIG_SND_SOC_WM8737 is not set
> CONFIG_SND_SOC_WM8741=m
> CONFIG_SND_SOC_WM8750=m
> CONFIG_SND_SOC_WM8753=m
> # CONFIG_SND_SOC_WM8770 is not set
> CONFIG_SND_SOC_WM8776=m
> CONFIG_SND_SOC_WM8782=m
> CONFIG_SND_SOC_WM8804=m
> CONFIG_SND_SOC_WM8804_I2C=m
> CONFIG_SND_SOC_WM8804_SPI=m
> CONFIG_SND_SOC_WM8900=m
> CONFIG_SND_SOC_WM8903=m
> CONFIG_SND_SOC_WM8904=m
> CONFIG_SND_SOC_WM8940=m
> CONFIG_SND_SOC_WM8955=m
> # CONFIG_SND_SOC_WM8960 is not set
> CONFIG_SND_SOC_WM8961=m
> # CONFIG_SND_SOC_WM8962 is not set
> CONFIG_SND_SOC_WM8971=m
> CONFIG_SND_SOC_WM8974=m
> # CONFIG_SND_SOC_WM8978 is not set
> CONFIG_SND_SOC_WM8983=m
> # CONFIG_SND_SOC_WM8985 is not set
> CONFIG_SND_SOC_WM8988=m
> CONFIG_SND_SOC_WM8990=m
> CONFIG_SND_SOC_WM8991=m
> CONFIG_SND_SOC_WM8993=m
> CONFIG_SND_SOC_WM8994=m
> CONFIG_SND_SOC_WM8995=m
> CONFIG_SND_SOC_WM8996=m
> # CONFIG_SND_SOC_WM8997 is not set
> CONFIG_SND_SOC_WM8998=m
> CONFIG_SND_SOC_WM9081=m
> CONFIG_SND_SOC_WM9090=m
> CONFIG_SND_SOC_WM9705=m
> CONFIG_SND_SOC_WM9712=m
> CONFIG_SND_SOC_WM9713=m
> # CONFIG_SND_SOC_WSA881X is not set
> CONFIG_SND_SOC_ZX_AUD96P22=m
> CONFIG_SND_SOC_LM4857=m
> # CONFIG_SND_SOC_MAX9759 is not set
> CONFIG_SND_SOC_MAX9768=m
> CONFIG_SND_SOC_MAX9877=m
> CONFIG_SND_SOC_MC13783=m
> CONFIG_SND_SOC_ML26124=m
> # CONFIG_SND_SOC_MT6351 is not set
> CONFIG_SND_SOC_MT6358=m
> # CONFIG_SND_SOC_MT6660 is not set
> CONFIG_SND_SOC_NAU8540=m
> CONFIG_SND_SOC_NAU8810=m
> CONFIG_SND_SOC_NAU8822=m
> CONFIG_SND_SOC_NAU8824=m
> CONFIG_SND_SOC_NAU8825=m
> CONFIG_SND_SOC_TPA6130A2=m
> # end of CODEC drivers
> 
> CONFIG_SND_SIMPLE_CARD_UTILS=m
> CONFIG_SND_SIMPLE_CARD=m
> # CONFIG_SND_AUDIO_GRAPH_CARD is not set
> # CONFIG_SND_X86 is not set
> CONFIG_AC97_BUS=m
> 
> #
> # HID support
> #
> CONFIG_HID=y
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=m
> 
> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=m
> CONFIG_HID_ACCUTOUCH=m
> CONFIG_HID_ACRUX=y
> # CONFIG_HID_ACRUX_FF is not set
> # CONFIG_HID_APPLE is not set
> CONFIG_HID_APPLEIR=m
> CONFIG_HID_ASUS=m
> CONFIG_HID_AUREAL=y
> # CONFIG_HID_BELKIN is not set
> CONFIG_HID_BETOP_FF=m
> CONFIG_HID_BIGBEN_FF=m
> CONFIG_HID_CHERRY=y
> CONFIG_HID_CHICONY=m
> CONFIG_HID_CORSAIR=m
> # CONFIG_HID_COUGAR is not set
> CONFIG_HID_MACALLY=m
> CONFIG_HID_PRODIKEYS=m
> # CONFIG_HID_CMEDIA is not set
> CONFIG_HID_CREATIVE_SB0540=m
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELAN=m
> CONFIG_HID_ELECOM=m
> CONFIG_HID_ELO=m
> CONFIG_HID_EZKEY=y
> CONFIG_HID_GEMBIRD=y
> CONFIG_HID_GFRM=m
> CONFIG_HID_HOLTEK=m
> CONFIG_HOLTEK_FF=y
> CONFIG_HID_GT683R=m
> CONFIG_HID_KEYTOUCH=y
> # CONFIG_HID_KYE is not set
> CONFIG_HID_UCLOGIC=m
> CONFIG_HID_WALTOP=m
> CONFIG_HID_VIEWSONIC=m
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=y
> CONFIG_HID_ITE=y
> # CONFIG_HID_JABRA is not set
> CONFIG_HID_TWINHAN=m
> CONFIG_HID_KENSINGTON=y
> CONFIG_HID_LCPOWER=m
> CONFIG_HID_LED=m
> CONFIG_HID_LENOVO=m
> CONFIG_HID_LOGITECH=m
> CONFIG_HID_LOGITECH_HIDPP=m
> CONFIG_LOGITECH_FF=y
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> CONFIG_HID_MALTRON=m
> CONFIG_HID_MAYFLASH=m
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=m
> CONFIG_HID_MONTEREY=y
> CONFIG_HID_MULTITOUCH=m
> # CONFIG_HID_NTI is not set
> # CONFIG_HID_NTRIG is not set
> CONFIG_HID_ORTEK=m
> CONFIG_HID_PANTHERLORD=y
> CONFIG_PANTHERLORD_FF=y
> # CONFIG_HID_PENMOUNT is not set
> CONFIG_HID_PETALYNX=y
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=m
> CONFIG_HID_RETRODE=m
> CONFIG_HID_ROCCAT=m
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=y
> # CONFIG_HID_SONY is not set
> CONFIG_HID_SPEEDLINK=y
> CONFIG_HID_STEAM=m
> CONFIG_HID_STEELSERIES=m
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=m
> CONFIG_HID_GREENASIA=y
> CONFIG_GREENASIA_FF=y
> CONFIG_HID_SMARTJOYPLUS=y
> CONFIG_SMARTJOYPLUS_FF=y
> CONFIG_HID_TIVO=y
> CONFIG_HID_TOPSEED=m
> CONFIG_HID_THINGM=m
> CONFIG_HID_THRUSTMASTER=y
> CONFIG_THRUSTMASTER_FF=y
> CONFIG_HID_UDRAW_PS3=m
> CONFIG_HID_U2FZERO=m
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=m
> CONFIG_HID_XINMO=y
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> CONFIG_HID_SENSOR_HUB=y
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
> CONFIG_HID_ALPS=m
> CONFIG_HID_MCP2221=m
> # end of Special HID drivers
> 
> #
> # USB HID support
> #
> CONFIG_USB_HID=m
> # CONFIG_HID_PID is not set
> CONFIG_USB_HIDDEV=y
> 
> #
> # USB HID Boot Protocol drivers
> #
> # CONFIG_USB_KBD is not set
> CONFIG_USB_MOUSE=y
> # end of USB HID Boot Protocol drivers
> # end of USB HID support
> 
> #
> # I2C HID support
> #
> CONFIG_I2C_HID=m
> # end of I2C HID support
> 
> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=y
> CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER=y
> # end of Intel ISH HID support
> # end of HID support
> 
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_ULPI_BUS=y
> CONFIG_USB_CONN_GPIO=m
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=y
> # CONFIG_USB_PCI is not set
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> 
> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=y
> # CONFIG_USB_DYNAMIC_MINORS is not set
> CONFIG_USB_OTG=y
> CONFIG_USB_OTG_WHITELIST=y
> CONFIG_USB_OTG_BLACKLIST_HUB=y
> CONFIG_USB_OTG_FSM=y
> CONFIG_USB_AUTOSUSPEND_DELAY=2
> CONFIG_USB_MON=y
> 
> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=y
> CONFIG_USB_XHCI_HCD=m
> CONFIG_USB_XHCI_PLATFORM=m
> # CONFIG_USB_XHCI_HISTB is not set
> CONFIG_USB_XHCI_MTK=m
> CONFIG_USB_XHCI_MVEBU=m
> CONFIG_USB_XHCI_RCAR=m
> # CONFIG_USB_EHCI_HCD is not set
> CONFIG_USB_OXU210HP_HCD=m
> CONFIG_USB_ISP116X_HCD=y
> # CONFIG_USB_ISP1362_HCD is not set
> CONFIG_USB_FOTG210_HCD=y
> CONFIG_USB_MAX3421_HCD=y
> # CONFIG_USB_OHCI_HCD is not set
> CONFIG_USB_SL811_HCD=y
> # CONFIG_USB_SL811_HCD_ISO is not set
> CONFIG_USB_SL811_CS=m
> # CONFIG_USB_R8A66597_HCD is not set
> CONFIG_USB_RENESAS_USBHS_HCD=m
> CONFIG_USB_HCD_BCMA=m
> # CONFIG_USB_HCD_SSB is not set
> CONFIG_USB_HCD_TEST_MODE=y
> CONFIG_USB_RENESAS_USBHS=m
> 
> #
> # USB Device Class drivers
> #
> CONFIG_USB_PRINTER=y
> CONFIG_USB_WDM=y
> # CONFIG_USB_TMC is not set
> 
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> 
> #
> # also be needed; see USB_STORAGE Help for more info
> #
> 
> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=y
> # CONFIG_USB_CDNS3 is not set
> # CONFIG_USB_MTU3 is not set
> # CONFIG_USB_MUSB_HDRC is not set
> CONFIG_USB_DWC3=y
> CONFIG_USB_DWC3_ULPI=y
> CONFIG_USB_DWC3_HOST=y
> # CONFIG_USB_DWC3_GADGET is not set
> # CONFIG_USB_DWC3_DUAL_ROLE is not set
> 
> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_OMAP=y
> CONFIG_USB_DWC3_EXYNOS=m
> CONFIG_USB_DWC3_KEYSTONE=y
> CONFIG_USB_DWC3_MESON_G12A=y
> # CONFIG_USB_DWC3_OF_SIMPLE is not set
> CONFIG_USB_DWC3_ST=m
> CONFIG_USB_DWC3_QCOM=m
> CONFIG_USB_DWC2=y
> # CONFIG_USB_DWC2_HOST is not set
> 
> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> CONFIG_USB_DWC2_PERIPHERAL=y
> # CONFIG_USB_DWC2_DUAL_ROLE is not set
> CONFIG_USB_DWC2_DEBUG=y
> CONFIG_USB_DWC2_VERBOSE=y
> CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
> # CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
> CONFIG_USB_CHIPIDEA=y
> CONFIG_USB_CHIPIDEA_OF=y
> CONFIG_USB_CHIPIDEA_UDC=y
> CONFIG_USB_ISP1760=y
> CONFIG_USB_ISP1760_HCD=y
> CONFIG_USB_ISP1761_UDC=y
> # CONFIG_USB_ISP1760_HOST_ROLE is not set
> # CONFIG_USB_ISP1760_GADGET_ROLE is not set
> CONFIG_USB_ISP1760_DUAL_ROLE=y
> 
> #
> # USB port drivers
> #
> 
> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=m
> CONFIG_USB_EMI26=y
> CONFIG_USB_ADUTUX=y
> CONFIG_USB_SEVSEG=y
> CONFIG_USB_LEGOTOWER=m
> CONFIG_USB_LCD=y
> CONFIG_USB_CYPRESS_CY7C63=m
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=y
> # CONFIG_USB_FTDI_ELAN is not set
> CONFIG_USB_APPLEDISPLAY=m
> CONFIG_APPLE_MFI_FASTCHARGE=m
> # CONFIG_USB_LD is not set
> CONFIG_USB_TRANCEVIBRATOR=y
> CONFIG_USB_IOWARRIOR=y
> # CONFIG_USB_TEST is not set
> CONFIG_USB_EHSET_TEST_FIXTURE=m
> CONFIG_USB_ISIGHTFW=y
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=y
> # CONFIG_USB_HUB_USB251XB is not set
> CONFIG_USB_HSIC_USB3503=m
> CONFIG_USB_HSIC_USB4604=m
> CONFIG_USB_LINK_LAYER_TEST=m
> CONFIG_USB_CHAOSKEY=m
> 
> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=y
> # CONFIG_KEYSTONE_USB_PHY is not set
> CONFIG_NOP_USB_XCEIV=m
> CONFIG_AM335X_CONTROL_USB=m
> CONFIG_AM335X_PHY_USB=m
> CONFIG_USB_GPIO_VBUS=m
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_ISP1301 is not set
> CONFIG_USB_TEGRA_PHY=m
> CONFIG_USB_ULPI=y
> CONFIG_USB_ULPI_VIEWPORT=y
> # end of USB Physical Layer drivers
> 
> CONFIG_USB_GADGET=y
> # CONFIG_USB_GADGET_DEBUG is not set
> # CONFIG_USB_GADGET_DEBUG_FS is not set
> CONFIG_USB_GADGET_VBUS_DRAW=2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
> 
> #
> # USB Peripheral Controller
> #
> # CONFIG_USB_LPC32XX is not set
> # CONFIG_USB_FOTG210_UDC is not set
> # CONFIG_USB_GR_UDC is not set
> CONFIG_USB_R8A66597=y
> CONFIG_USB_RENESAS_USBHS_UDC=m
> # CONFIG_USB_RENESAS_USB3 is not set
> CONFIG_USB_PXA27X=m
> CONFIG_USB_MV_UDC=y
> # CONFIG_USB_MV_U3D is not set
> CONFIG_USB_SNP_CORE=y
> CONFIG_USB_SNP_UDC_PLAT=y
> CONFIG_USB_M66592=y
> # CONFIG_USB_BDC_UDC is not set
> # CONFIG_USB_NET2272 is not set
> CONFIG_USB_GADGET_XILINX=y
> # CONFIG_USB_ASPEED_VHUB is not set
> CONFIG_USB_DUMMY_HCD=y
> # end of USB Peripheral Controller
> 
> CONFIG_USB_LIBCOMPOSITE=y
> CONFIG_USB_F_SS_LB=y
> CONFIG_USB_U_AUDIO=m
> CONFIG_USB_F_UAC1=m
> CONFIG_USB_F_UAC1_LEGACY=m
> CONFIG_USB_F_UAC2=m
> CONFIG_USB_F_HID=y
> CONFIG_USB_CONFIGFS=y
> CONFIG_USB_CONFIGFS_F_LB_SS=y
> # CONFIG_USB_CONFIGFS_F_FS is not set
> CONFIG_USB_CONFIGFS_F_UAC1=y
> CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
> CONFIG_USB_CONFIGFS_F_UAC2=y
> # CONFIG_USB_CONFIGFS_F_MIDI is not set
> CONFIG_USB_CONFIGFS_F_HID=y
> # CONFIG_USB_CONFIGFS_F_PRINTER is not set
> # CONFIG_TYPEC is not set
> CONFIG_USB_ROLE_SWITCH=y
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=y
> CONFIG_MEMSTICK_DEBUG=y
> 
> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=y
> 
> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=m
> CONFIG_MEMSTICK_JMICRON_38X=m
> CONFIG_MEMSTICK_R592=y
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=m
> CONFIG_LEDS_CLASS_FLASH=m
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> 
> #
> # LED drivers
> #
> CONFIG_LEDS_AAT1290=m
> CONFIG_LEDS_AN30259A=m
> CONFIG_LEDS_AS3645A=m
> CONFIG_LEDS_BCM6328=m
> CONFIG_LEDS_BCM6358=m
> CONFIG_LEDS_CPCAP=m
> CONFIG_LEDS_CR0014114=m
> # CONFIG_LEDS_EL15203000 is not set
> CONFIG_LEDS_LM3530=m
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_LM3692X=m
> CONFIG_LEDS_LM3601X=m
> CONFIG_LEDS_MT6323=m
> CONFIG_LEDS_NET48XX=m
> CONFIG_LEDS_WRAP=m
> CONFIG_LEDS_PCA9532=m
> # CONFIG_LEDS_PCA9532_GPIO is not set
> CONFIG_LEDS_GPIO=m
> CONFIG_LEDS_LP3944=m
> CONFIG_LEDS_LP3952=m
> CONFIG_LEDS_LP55XX_COMMON=m
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=m
> CONFIG_LEDS_LP5562=m
> CONFIG_LEDS_LP8501=m
> CONFIG_LEDS_LP8860=m
> CONFIG_LEDS_PCA955X=m
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=m
> CONFIG_LEDS_DAC124S085=m
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=m
> CONFIG_LEDS_BD2802=m
> CONFIG_LEDS_LT3593=m
> CONFIG_LEDS_MC13783=m
> CONFIG_LEDS_TCA6507=m
> CONFIG_LEDS_TLC591XX=m
> CONFIG_LEDS_MAX77650=m
> CONFIG_LEDS_LM355x=m
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_MENF21BMC=m
> CONFIG_LEDS_KTD2692=m
> # CONFIG_LEDS_IS31FL319X is not set
> # CONFIG_LEDS_IS31FL32XX is not set
> # CONFIG_LEDS_SC27XX_BLTC is not set
> 
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> CONFIG_LEDS_BLINKM=m
> # CONFIG_LEDS_PM8058 is not set
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=m
> # CONFIG_LEDS_SPI_BYTE is not set
> CONFIG_LEDS_TI_LMU_COMMON=m
> # CONFIG_LEDS_LM3697 is not set
> 
> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC_ATOMIC_SCRUB=y
> CONFIG_EDAC_SUPPORT=y
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=y
> CONFIG_RTC_MC146818_LIB=y
> CONFIG_RTC_CLASS=y
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> CONFIG_RTC_DEBUG=y
> # CONFIG_RTC_NVMEM is not set
> 
> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> CONFIG_RTC_INTF_DEV=y
> CONFIG_RTC_INTF_DEV_UIE_EMUL=y
> # CONFIG_RTC_DRV_TEST is not set
> 
> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM80X=m
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> CONFIG_RTC_DRV_ABX80X=m
> CONFIG_RTC_DRV_BRCMSTB=m
> CONFIG_RTC_DRV_DS1307=m
> CONFIG_RTC_DRV_DS1307_CENTURY=y
> CONFIG_RTC_DRV_DS1374=m
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=m
> CONFIG_RTC_DRV_HYM8563=m
> CONFIG_RTC_DRV_MAX6900=m
> CONFIG_RTC_DRV_MAX8907=m
> # CONFIG_RTC_DRV_MAX77686 is not set
> # CONFIG_RTC_DRV_RK808 is not set
> CONFIG_RTC_DRV_RS5C372=m
> # CONFIG_RTC_DRV_ISL1208 is not set
> # CONFIG_RTC_DRV_ISL12022 is not set
> # CONFIG_RTC_DRV_ISL12026 is not set
> CONFIG_RTC_DRV_X1205=m
> CONFIG_RTC_DRV_PCF8523=m
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=m
> CONFIG_RTC_DRV_PCF8583=m
> CONFIG_RTC_DRV_M41T80=m
> CONFIG_RTC_DRV_M41T80_WDT=y
> CONFIG_RTC_DRV_BQ32K=m
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=m
> # CONFIG_RTC_DRV_RX8010 is not set
> # CONFIG_RTC_DRV_RX8581 is not set
> CONFIG_RTC_DRV_RX8025=m
> CONFIG_RTC_DRV_EM3027=m
> CONFIG_RTC_DRV_RV3028=m
> CONFIG_RTC_DRV_RV8803=m
> CONFIG_RTC_DRV_S5M=m
> # CONFIG_RTC_DRV_SD3078 is not set
> 
> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> CONFIG_RTC_DRV_M41T94=m
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> CONFIG_RTC_DRV_DS1343=m
> CONFIG_RTC_DRV_DS1347=m
> # CONFIG_RTC_DRV_DS1390 is not set
> # CONFIG_RTC_DRV_MAX6916 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> CONFIG_RTC_DRV_RX4581=m
> CONFIG_RTC_DRV_RX6110=y
> CONFIG_RTC_DRV_RS5C348=y
> CONFIG_RTC_DRV_MAX6902=m
> CONFIG_RTC_DRV_PCF2123=y
> CONFIG_RTC_DRV_MCP795=m
> CONFIG_RTC_I2C_AND_SPI=m
> 
> #
> # SPI and I2C RTC drivers
> #
> # CONFIG_RTC_DRV_DS3232 is not set
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_RV3029C2=m
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> 
> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=m
> CONFIG_RTC_DRV_DS1286=y
> CONFIG_RTC_DRV_DS1511=m
> CONFIG_RTC_DRV_DS1553=m
> CONFIG_RTC_DRV_DS1685_FAMILY=m
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> # CONFIG_RTC_DRV_DS17285 is not set
> # CONFIG_RTC_DRV_DS17485 is not set
> CONFIG_RTC_DRV_DS17885=y
> # CONFIG_RTC_DRV_DS1742 is not set
> # CONFIG_RTC_DRV_DS2404 is not set
> CONFIG_RTC_DRV_DA9063=m
> # CONFIG_RTC_DRV_STK17TA8 is not set
> CONFIG_RTC_DRV_M48T86=y
> # CONFIG_RTC_DRV_M48T35 is not set
> CONFIG_RTC_DRV_M48T59=m
> CONFIG_RTC_DRV_MSM6242=y
> CONFIG_RTC_DRV_BQ4802=m
> CONFIG_RTC_DRV_RP5C01=m
> CONFIG_RTC_DRV_V3020=y
> CONFIG_RTC_DRV_SC27XX=m
> CONFIG_RTC_DRV_SPEAR=y
> # CONFIG_RTC_DRV_PCF50633 is not set
> CONFIG_RTC_DRV_ZYNQMP=y
> 
> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_ASM9260 is not set
> CONFIG_RTC_DRV_DAVINCI=y
> CONFIG_RTC_DRV_DIGICOLOR=y
> CONFIG_RTC_DRV_FSL_FTM_ALARM=y
> # CONFIG_RTC_DRV_MESON is not set
> # CONFIG_RTC_DRV_MESON_VRTC is not set
> CONFIG_RTC_DRV_OMAP=y
> CONFIG_RTC_DRV_S3C=m
> CONFIG_RTC_DRV_EP93XX=y
> CONFIG_RTC_DRV_VR41XX=y
> CONFIG_RTC_DRV_AT91RM9200=y
> CONFIG_RTC_DRV_AT91SAM9=y
> CONFIG_RTC_DRV_GENERIC=y
> CONFIG_RTC_DRV_VT8500=y
> CONFIG_RTC_DRV_SUN6I=y
> CONFIG_RTC_DRV_SUNXI=m
> # CONFIG_RTC_DRV_TX4939 is not set
> CONFIG_RTC_DRV_MV=m
> # CONFIG_RTC_DRV_ARMADA38X is not set
> CONFIG_RTC_DRV_CADENCE=y
> # CONFIG_RTC_DRV_FTRTC010 is not set
> # CONFIG_RTC_DRV_COH901331 is not set
> CONFIG_RTC_DRV_STMP=m
> # CONFIG_RTC_DRV_PCAP is not set
> CONFIG_RTC_DRV_MC13XXX=m
> CONFIG_RTC_DRV_JZ4740=m
> # CONFIG_RTC_DRV_LPC24XX is not set
> # CONFIG_RTC_DRV_LPC32XX is not set
> CONFIG_RTC_DRV_PM8XXX=m
> # CONFIG_RTC_DRV_TEGRA is not set
> CONFIG_RTC_DRV_SNVS=m
> CONFIG_RTC_DRV_MOXART=y
> # CONFIG_RTC_DRV_MT6397 is not set
> # CONFIG_RTC_DRV_MT7622 is not set
> CONFIG_RTC_DRV_XGENE=m
> # CONFIG_RTC_DRV_R7301 is not set
> CONFIG_RTC_DRV_STM32=y
> CONFIG_RTC_DRV_CPCAP=m
> # CONFIG_RTC_DRV_RTD119X is not set
> CONFIG_RTC_DRV_ASPEED=y
> 
> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
> CONFIG_RTC_DRV_GOLDFISH=m
> CONFIG_DMADEVICES=y
> # CONFIG_DMADEVICES_DEBUG is not set
> 
> #
> # DMA Devices
> #
> CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
> CONFIG_DMA_ENGINE=y
> CONFIG_DMA_VIRTUAL_CHANNELS=y
> CONFIG_DMA_OF=y
> # CONFIG_ALTERA_MSGDMA is not set
> # CONFIG_AXI_DMAC is not set
> # CONFIG_COH901318 is not set
> # CONFIG_DMA_JZ4780 is not set
> CONFIG_DMA_SA11X0=m
> # CONFIG_DMA_SUN6I is not set
> CONFIG_DW_AXI_DMAC=m
> # CONFIG_EP93XX_DMA is not set
> # CONFIG_FSL_EDMA is not set
> CONFIG_IMG_MDC_DMA=y
> # CONFIG_INTEL_IDMA64 is not set
> # CONFIG_INTEL_IOP_ADMA is not set
> CONFIG_K3_DMA=m
> CONFIG_MCF_EDMA=y
> CONFIG_MILBEAUT_HDMAC=y
> CONFIG_MILBEAUT_XDMAC=m
> CONFIG_MMP_PDMA=y
> CONFIG_MMP_TDMA=y
> # CONFIG_MV_XOR is not set
> CONFIG_MXS_DMA=y
> CONFIG_NBPFAXI_DMA=m
> # CONFIG_PCH_DMA is not set
> # CONFIG_PLX_DMA is not set
> # CONFIG_STM32_DMA is not set
> # CONFIG_STM32_DMAMUX is not set
> CONFIG_STM32_MDMA=y
> CONFIG_SPRD_DMA=m
> # CONFIG_S3C24XX_DMAC is not set
> CONFIG_TEGRA20_APB_DMA=m
> # CONFIG_TEGRA210_ADMA is not set
> CONFIG_TIMB_DMA=m
> # CONFIG_UNIPHIER_MDMAC is not set
> # CONFIG_UNIPHIER_XDMAC is not set
> CONFIG_XGENE_DMA=m
> CONFIG_ZX_DMA=m
> CONFIG_MTK_HSDMA=m
> # CONFIG_MTK_CQDMA is not set
> CONFIG_QCOM_HIDMA_MGMT=m
> CONFIG_QCOM_HIDMA=m
> CONFIG_DW_DMAC_CORE=y
> CONFIG_DW_DMAC=m
> CONFIG_DW_DMAC_PCI=y
> CONFIG_SF_PDMA=m
> CONFIG_RENESAS_DMA=y
> CONFIG_SH_DMAE_BASE=y
> CONFIG_SH_DMAE=y
> # CONFIG_RCAR_DMAC is not set
> # CONFIG_RENESAS_USB_DMAC is not set
> CONFIG_TI_EDMA=m
> CONFIG_DMA_OMAP=m
> CONFIG_TI_DMA_CROSSBAR=y
> 
> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=y
> CONFIG_DMATEST=m
> CONFIG_DMA_ENGINE_RAID=y
> 
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> CONFIG_SW_SYNC=y
> CONFIG_UDMABUF=y
> CONFIG_DMABUF_SELFTESTS=m
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> 
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_CHARLCD is not set
> # CONFIG_UIO is not set
> CONFIG_VFIO_IOMMU_TYPE1=m
> CONFIG_VFIO_VIRQFD=m
> CONFIG_VFIO=m
> CONFIG_VFIO_NOIOMMU=y
> CONFIG_VFIO_PCI=m
> # CONFIG_VFIO_PCI_VGA is not set
> CONFIG_VFIO_PCI_MMAP=y
> CONFIG_VFIO_PCI_INTX=y
> CONFIG_VFIO_PCI_IGD=y
> # CONFIG_VFIO_MDEV is not set
> CONFIG_IRQ_BYPASS_MANAGER=m
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=y
> CONFIG_VIRTIO_MENU=y
> CONFIG_VIRTIO_PCI=y
> # CONFIG_VIRTIO_PCI_LEGACY is not set
> # CONFIG_VIRTIO_BALLOON is not set
> # CONFIG_VIRTIO_INPUT is not set
> # CONFIG_VIRTIO_MMIO is not set
> 
> #
> # Microsoft Hyper-V guest support
> #
> # end of Microsoft Hyper-V guest support
> 
> CONFIG_GREYBUS=y
> CONFIG_GREYBUS_ES2=y
> # CONFIG_STAGING is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=y
> # CONFIG_GOLDFISH_PIPE is not set
> # CONFIG_MFD_CROS_EC is not set
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_MELLANOX_PLATFORM=y
> # CONFIG_MLXREG_HOTPLUG is not set
> CONFIG_MLXREG_IO=y
> # CONFIG_OLPC_XO175 is not set
> CONFIG_CLKDEV_LOOKUP=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> 
> #
> # Common Clock Framework
> #
> CONFIG_COMMON_CLK_VERSATILE=y
> # CONFIG_CLK_SP810 is not set
> # CONFIG_CLK_HSDK is not set
> CONFIG_COMMON_CLK_MAX77686=y
> CONFIG_COMMON_CLK_MAX9485=m
> CONFIG_COMMON_CLK_RK808=m
> CONFIG_COMMON_CLK_HI655X=y
> # CONFIG_COMMON_CLK_SCMI is not set
> CONFIG_COMMON_CLK_SCPI=y
> CONFIG_COMMON_CLK_SI5341=m
> # CONFIG_COMMON_CLK_SI5351 is not set
> CONFIG_COMMON_CLK_SI514=m
> CONFIG_COMMON_CLK_SI544=m
> CONFIG_COMMON_CLK_SI570=m
> # CONFIG_COMMON_CLK_BM1880 is not set
> CONFIG_COMMON_CLK_CDCE706=m
> CONFIG_COMMON_CLK_CDCE925=m
> CONFIG_COMMON_CLK_CS2000_CP=m
> # CONFIG_COMMON_CLK_FSL_SAI is not set
> # CONFIG_COMMON_CLK_GEMINI is not set
> # CONFIG_COMMON_CLK_ASPEED is not set
> CONFIG_COMMON_CLK_S2MPS11=y
> # CONFIG_COMMON_CLK_AXI_CLKGEN is not set
> # CONFIG_CLK_QORIQ is not set
> # CONFIG_CLK_LS1028A_PLLDIG is not set
> # CONFIG_COMMON_CLK_XGENE is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_COMMON_CLK_OXNAS is not set
> CONFIG_COMMON_CLK_VC5=m
> CONFIG_COMMON_CLK_FIXED_MMIO=y
> CONFIG_CLK_ACTIONS=y
> CONFIG_CLK_OWL_S500=y
> # CONFIG_CLK_OWL_S700 is not set
> # CONFIG_CLK_OWL_S900 is not set
> CONFIG_CLK_BCM2835=y
> CONFIG_CLK_BCM_63XX=y
> # CONFIG_CLK_BCM_63XX_GATE is not set
> CONFIG_CLK_BCM_KONA=y
> CONFIG_COMMON_CLK_IPROC=y
> # CONFIG_CLK_BCM_CYGNUS is not set
> CONFIG_CLK_BCM_HR2=y
> # CONFIG_CLK_BCM_NSP is not set
> # CONFIG_CLK_BCM_NS2 is not set
> CONFIG_CLK_BCM_SR=y
> # CONFIG_CLK_RASPBERRYPI is not set
> # CONFIG_COMMON_CLK_HI3516CV300 is not set
> CONFIG_COMMON_CLK_HI3519=y
> # CONFIG_COMMON_CLK_HI3660 is not set
> # CONFIG_COMMON_CLK_HI3670 is not set
> CONFIG_COMMON_CLK_HI3798CV200=y
> # CONFIG_COMMON_CLK_HI6220 is not set
> CONFIG_RESET_HISI=y
> # CONFIG_STUB_CLK_HI6220 is not set
> CONFIG_STUB_CLK_HI3660=y
> CONFIG_COMMON_CLK_BOSTON=y
> 
> #
> # Ingenic SoCs drivers
> #
> CONFIG_INGENIC_CGU_COMMON=y
> CONFIG_INGENIC_CGU_JZ4740=y
> CONFIG_INGENIC_CGU_JZ4725B=y
> CONFIG_INGENIC_CGU_JZ4770=y
> CONFIG_INGENIC_CGU_JZ4780=y
> # CONFIG_INGENIC_CGU_X1000 is not set
> CONFIG_INGENIC_TCU_CLK=y
> # end of Ingenic SoCs drivers
> 
> CONFIG_COMMON_CLK_KEYSTONE=m
> 
> #
> # Clock driver for MediaTek SoC
> #
> CONFIG_COMMON_CLK_MEDIATEK=y
> # CONFIG_COMMON_CLK_MT2701 is not set
> # CONFIG_COMMON_CLK_MT2712 is not set
> CONFIG_COMMON_CLK_MT6779=y
> # CONFIG_COMMON_CLK_MT6779_MMSYS is not set
> CONFIG_COMMON_CLK_MT6779_IMGSYS=y
> # CONFIG_COMMON_CLK_MT6779_IPESYS is not set
> # CONFIG_COMMON_CLK_MT6779_CAMSYS is not set
> CONFIG_COMMON_CLK_MT6779_VDECSYS=y
> CONFIG_COMMON_CLK_MT6779_VENCSYS=y
> # CONFIG_COMMON_CLK_MT6779_MFGCFG is not set
> CONFIG_COMMON_CLK_MT6779_AUDSYS=y
> # CONFIG_COMMON_CLK_MT6797 is not set
> CONFIG_COMMON_CLK_MT7622=y
> CONFIG_COMMON_CLK_MT7622_ETHSYS=y
> CONFIG_COMMON_CLK_MT7622_HIFSYS=y
> CONFIG_COMMON_CLK_MT7622_AUDSYS=y
> CONFIG_COMMON_CLK_MT7629=y
> CONFIG_COMMON_CLK_MT7629_ETHSYS=y
> # CONFIG_COMMON_CLK_MT7629_HIFSYS is not set
> CONFIG_COMMON_CLK_MT8135=y
> CONFIG_COMMON_CLK_MT8173=y
> CONFIG_COMMON_CLK_MT8183=y
> CONFIG_COMMON_CLK_MT8183_AUDIOSYS=y
> CONFIG_COMMON_CLK_MT8183_CAMSYS=y
> CONFIG_COMMON_CLK_MT8183_IMGSYS=y
> CONFIG_COMMON_CLK_MT8183_IPU_CORE0=y
> CONFIG_COMMON_CLK_MT8183_IPU_CORE1=y
> CONFIG_COMMON_CLK_MT8183_IPU_ADL=y
> # CONFIG_COMMON_CLK_MT8183_IPU_CONN is not set
> CONFIG_COMMON_CLK_MT8183_MFGCFG=y
> # CONFIG_COMMON_CLK_MT8183_MMSYS is not set
> # CONFIG_COMMON_CLK_MT8183_VDECSYS is not set
> # CONFIG_COMMON_CLK_MT8183_VENCSYS is not set
> # CONFIG_COMMON_CLK_MT8516 is not set
> # end of Clock driver for MediaTek SoC
> 
> # CONFIG_COMMON_CLK_AXG_AUDIO is not set
> CONFIG_QCOM_GDSC=y
> CONFIG_COMMON_CLK_QCOM=y
> # CONFIG_QCOM_A53PLL is not set
> CONFIG_QCOM_CLK_APCS_MSM8916=y
> CONFIG_QCOM_CLK_RPMH=m
> CONFIG_APQ_GCC_8084=y
> # CONFIG_APQ_MMCC_8084 is not set
> # CONFIG_IPQ_GCC_4019 is not set
> CONFIG_IPQ_GCC_6018=m
> CONFIG_IPQ_GCC_806X=m
> CONFIG_IPQ_LCC_806X=m
> # CONFIG_IPQ_GCC_8074 is not set
> CONFIG_MSM_GCC_8660=y
> # CONFIG_MSM_GCC_8916 is not set
> CONFIG_MSM_GCC_8960=y
> CONFIG_MSM_LCC_8960=y
> # CONFIG_MDM_GCC_9615 is not set
> # CONFIG_MDM_LCC_9615 is not set
> # CONFIG_MSM_MMCC_8960 is not set
> CONFIG_MSM_GCC_8974=y
> # CONFIG_MSM_MMCC_8974 is not set
> CONFIG_MSM_GCC_8994=y
> CONFIG_MSM_GCC_8996=m
> CONFIG_MSM_MMCC_8996=m
> CONFIG_MSM_GCC_8998=m
> CONFIG_MSM_GPUCC_8998=m
> CONFIG_MSM_MMCC_8998=m
> CONFIG_QCS_GCC_404=m
> CONFIG_SC_DISPCC_7180=y
> CONFIG_SC_GCC_7180=y
> # CONFIG_SC_GPUCC_7180 is not set
> CONFIG_SC_VIDEOCC_7180=m
> # CONFIG_SDM_CAMCC_845 is not set
> CONFIG_SDM_GCC_660=y
> # CONFIG_QCS_TURING_404 is not set
> CONFIG_QCS_Q6SSTOP_404=m
> CONFIG_SDM_GCC_845=m
> # CONFIG_SDM_GPUCC_845 is not set
> # CONFIG_SDM_VIDEOCC_845 is not set
> CONFIG_SDM_DISPCC_845=m
> CONFIG_SDM_LPASSCC_845=m
> # CONFIG_SM_GCC_8150 is not set
> CONFIG_SPMI_PMIC_CLKDIV=y
> CONFIG_QCOM_HFPLL=y
> CONFIG_KPSS_XCC=y
> CONFIG_CLK_RENESAS=y
> # CONFIG_CLK_EMEV2 is not set
> # CONFIG_CLK_RZA1 is not set
> CONFIG_CLK_R7S9210=y
> # CONFIG_CLK_R8A73A4 is not set
> # CONFIG_CLK_R8A7740 is not set
> # CONFIG_CLK_R8A7743 is not set
> # CONFIG_CLK_R8A7745 is not set
> # CONFIG_CLK_R8A77470 is not set
> CONFIG_CLK_R8A774A1=y
> # CONFIG_CLK_R8A774B1 is not set
> # CONFIG_CLK_R8A774C0 is not set
> CONFIG_CLK_R8A7778=y
> CONFIG_CLK_R8A7779=y
> # CONFIG_CLK_R8A7790 is not set
> CONFIG_CLK_R8A7791=y
> # CONFIG_CLK_R8A7792 is not set
> CONFIG_CLK_R8A7794=y
> # CONFIG_CLK_R8A7795 is not set
> CONFIG_CLK_R8A77960=y
> # CONFIG_CLK_R8A77961 is not set
> # CONFIG_CLK_R8A77965 is not set
> # CONFIG_CLK_R8A77970 is not set
> # CONFIG_CLK_R8A77980 is not set
> # CONFIG_CLK_R8A77990 is not set
> CONFIG_CLK_R8A77995=y
> # CONFIG_CLK_R9A06G032 is not set
> # CONFIG_CLK_SH73A0 is not set
> CONFIG_CLK_RCAR_GEN2_CPG=y
> CONFIG_CLK_RCAR_GEN3_CPG=y
> # CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
> CONFIG_CLK_RENESAS_CPG_MSSR=y
> CONFIG_CLK_RENESAS_CPG_MSTP=y
> CONFIG_CLK_RENESAS_DIV6=y
> CONFIG_COMMON_CLK_SAMSUNG=y
> CONFIG_EXYNOS_ARM64_COMMON_CLK=y
> CONFIG_EXYNOS_AUDSS_CLK_CON=m
> # CONFIG_S3C2410_COMMON_CLK is not set
> CONFIG_S3C2412_COMMON_CLK=y
> # CONFIG_S3C2443_COMMON_CLK is not set
> # CONFIG_CLK_SIFIVE is not set
> # CONFIG_SPRD_COMMON_CLK is not set
> CONFIG_CLK_SUNXI=y
> # CONFIG_CLK_SUNXI_CLOCKS is not set
> # CONFIG_CLK_SUNXI_PRCM_SUN6I is not set
> # CONFIG_CLK_SUNXI_PRCM_SUN8I is not set
> CONFIG_CLK_SUNXI_PRCM_SUN9I=y
> # CONFIG_SUNXI_CCU is not set
> # CONFIG_COMMON_CLK_TI_ADPLL is not set
> CONFIG_CLK_UNIPHIER=y
> # end of Common Clock Framework
> 
> # CONFIG_HWSPINLOCK is not set
> 
> #
> # Clock Source drivers
> #
> CONFIG_TIMER_OF=y
> CONFIG_TIMER_PROBE=y
> CONFIG_CLKSRC_I8253=y
> CONFIG_CLKEVT_I8253=y
> CONFIG_CLKBLD_I8253=y
> CONFIG_CLKSRC_MMIO=y
> # CONFIG_BCM2835_TIMER is not set
> # CONFIG_BCM_KONA_TIMER is not set
> CONFIG_DAVINCI_TIMER=y
> # CONFIG_DIGICOLOR_TIMER is not set
> # CONFIG_DW_APB_TIMER is not set
> # CONFIG_FTTMR010_TIMER is not set
> CONFIG_IXP4XX_TIMER=y
> CONFIG_MESON6_TIMER=y
> # CONFIG_OWL_TIMER is not set
> # CONFIG_RDA_TIMER is not set
> # CONFIG_SUN4I_TIMER is not set
> CONFIG_SUN5I_HSTIMER=y
> # CONFIG_TEGRA_TIMER is not set
> # CONFIG_VT8500_TIMER is not set
> # CONFIG_NPCM7XX_TIMER is not set
> # CONFIG_CADENCE_TTC_TIMER is not set
> # CONFIG_ASM9260_TIMER is not set
> # CONFIG_CLKSRC_DBX500_PRCMU is not set
> CONFIG_CLPS711X_TIMER=y
> # CONFIG_ATLAS7_TIMER is not set
> # CONFIG_MXS_TIMER is not set
> CONFIG_PRIMA2_TIMER=y
> CONFIG_NSPIRE_TIMER=y
> CONFIG_INTEGRATOR_AP_TIMER=y
> CONFIG_CLKSRC_PISTACHIO=y
> CONFIG_ARMV7M_SYSTICK=y
> CONFIG_ATMEL_PIT=y
> # CONFIG_ATMEL_ST is not set
> CONFIG_CLKSRC_SAMSUNG_PWM=y
> # CONFIG_FSL_FTM_TIMER is not set
> CONFIG_OXNAS_RPS_TIMER=y
> CONFIG_MTK_TIMER=y
> # CONFIG_SPRD_TIMER is not set
> CONFIG_CLKSRC_JCORE_PIT=y
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_RENESAS_OSTM is not set
> # CONFIG_SH_TIMER_TMU is not set
> CONFIG_EM_TIMER_STI=y
> # CONFIG_CLKSRC_PXA is not set
> # CONFIG_H8300_TMR8 is not set
> # CONFIG_H8300_TMR16 is not set
> # CONFIG_H8300_TPU is not set
> # CONFIG_TIMER_IMX_SYS_CTR is not set
> # CONFIG_CLKSRC_ST_LPC is not set
> CONFIG_ATCPIT100_TIMER=y
> CONFIG_INGENIC_TIMER=y
> CONFIG_INGENIC_OST=y
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
> 
> CONFIG_MAILBOX=y
> CONFIG_IMX_MBOX=m
> CONFIG_PLATFORM_MHU=m
> CONFIG_ARMADA_37XX_RWTM_MBOX=m
> # CONFIG_ROCKCHIP_MBOX is not set
> CONFIG_ALTERA_MBOX=y
> CONFIG_HI3660_MBOX=m
> CONFIG_HI6220_MBOX=y
> CONFIG_MAILBOX_TEST=y
> CONFIG_QCOM_APCS_IPC=y
> CONFIG_BCM_PDC_MBOX=m
> CONFIG_MTK_CMDQ_MBOX=y
> CONFIG_IOMMU_IOVA=y
> CONFIG_IOMMU_API=y
> CONFIG_IOMMU_SUPPORT=y
> 
> #
> # Generic IOMMU Pagetable Support
> #
> CONFIG_IOMMU_IO_PGTABLE=y
> CONFIG_IOMMU_IO_PGTABLE_LPAE=y
> CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
> CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
> CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST=y
> # end of Generic IOMMU Pagetable Support
> 
> CONFIG_IOMMU_DEBUGFS=y
> CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
> CONFIG_OF_IOMMU=y
> CONFIG_IOMMU_DMA=y
> CONFIG_IPMMU_VMSA=y
> CONFIG_ARM_SMMU=m
> # CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT is not set
> # CONFIG_S390_CCW_IOMMU is not set
> # CONFIG_S390_AP_IOMMU is not set
> CONFIG_MTK_IOMMU=y
> # CONFIG_QCOM_IOMMU is not set
> 
> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=y
> # end of Remoteproc drivers
> 
> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=y
> CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
> CONFIG_RPMSG_QCOM_GLINK_RPM=y
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> 
> CONFIG_SOUNDWIRE=y
> 
> #
> # SoundWire Devices
> #
> CONFIG_SOUNDWIRE_QCOM=m
> 
> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_OWL_PM_DOMAINS is not set
> 
> #
> # Amlogic SoC drivers
> #
> CONFIG_MESON_CANVAS=m
> # CONFIG_MESON_CLK_MEASURE is not set
> # CONFIG_MESON_GX_SOCINFO is not set
> CONFIG_MESON_GX_PM_DOMAINS=y
> # CONFIG_MESON_EE_PM_DOMAINS is not set
> # CONFIG_MESON_MX_SOCINFO is not set
> # end of Amlogic SoC drivers
> 
> #
> # Aspeed SoC drivers
> #
> CONFIG_SOC_ASPEED=y
> CONFIG_ASPEED_LPC_CTRL=m
> # CONFIG_ASPEED_LPC_SNOOP is not set
> CONFIG_ASPEED_P2A_CTRL=y
> # end of Aspeed SoC drivers
> 
> CONFIG_AT91_SOC_ID=y
> # CONFIG_AT91_SOC_SFR is not set
> 
> #
> # Broadcom SoC drivers
> #
> CONFIG_BCM2835_POWER=y
> CONFIG_SOC_BRCMSTB=y
> # end of Broadcom SoC drivers
> 
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> CONFIG_QUICC_ENGINE=y
> CONFIG_DPAA2_CONSOLE=y
> # end of NXP/Freescale QorIQ SoC drivers
> 
> #
> # i.MX SoC drivers
> #
> # CONFIG_IMX_GPCV2_PM_DOMAINS is not set
> CONFIG_IMX_SCU_SOC=y
> # CONFIG_SOC_IMX8M is not set
> # end of i.MX SoC drivers
> 
> #
> # IXP4xx SoC drivers
> #
> # CONFIG_IXP4XX_QMGR is not set
> CONFIG_IXP4XX_NPE=m
> # end of IXP4xx SoC drivers
> 
> #
> # MediaTek SoC drivers
> #
> CONFIG_MTK_CMDQ=m
> CONFIG_MTK_INFRACFG=y
> CONFIG_MTK_PMIC_WRAP=m
> CONFIG_MTK_SCPSYS=y
> # end of MediaTek SoC drivers
> 
> #
> # Qualcomm SoC drivers
> #
> CONFIG_QCOM_AOSS_QMP=y
> CONFIG_QCOM_GENI_SE=m
> CONFIG_QCOM_GSBI=y
> # CONFIG_QCOM_LLCC is not set
> CONFIG_QCOM_RPMH=y
> # CONFIG_QCOM_SMD_RPM is not set
> CONFIG_QCOM_WCNSS_CTRL=m
> CONFIG_QCOM_APR=m
> # end of Qualcomm SoC drivers
> 
> # CONFIG_SOC_RENESAS is not set
> CONFIG_ROCKCHIP_GRF=y
> # CONFIG_ROCKCHIP_PM_DOMAINS is not set
> # CONFIG_SOC_SAMSUNG is not set
> CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
> CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
> # CONFIG_SOC_TI is not set
> CONFIG_UX500_SOC_ID=y
> 
> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=m
> # end of Xilinx SoC drivers
> 
> # CONFIG_SOC_ZTE is not set
> # end of SOC (System On Chip) specific Drivers
> 
> CONFIG_PM_DEVFREQ=y
> 
> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> CONFIG_DEVFREQ_GOV_PERFORMANCE=m
> CONFIG_DEVFREQ_GOV_POWERSAVE=y
> CONFIG_DEVFREQ_GOV_USERSPACE=y
> CONFIG_DEVFREQ_GOV_PASSIVE=y
> 
> #
> # DEVFREQ Drivers
> #
> CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
> CONFIG_ARM_TEGRA_DEVFREQ=y
> CONFIG_ARM_TEGRA20_DEVFREQ=m
> CONFIG_PM_DEVFREQ_EVENT=y
> CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
> CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
> CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=m
> CONFIG_EXTCON=y
> 
> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=y
> CONFIG_EXTCON_ARIZONA=m
> CONFIG_EXTCON_FSA9480=m
> # CONFIG_EXTCON_GPIO is not set
> CONFIG_EXTCON_MAX3355=m
> CONFIG_EXTCON_PTN5150=m
> CONFIG_EXTCON_QCOM_SPMI_MISC=m
> CONFIG_EXTCON_RT8973A=m
> CONFIG_EXTCON_SM5502=m
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_MEMORY=y
> CONFIG_DDR=y
> CONFIG_JZ4780_NEMC=y
> CONFIG_MTK_SMI=y
> CONFIG_SAMSUNG_MC=y
> CONFIG_EXYNOS5422_DMC=y
> CONFIG_EXYNOS_SROM=y
> CONFIG_IIO=y
> CONFIG_IIO_BUFFER=y
> CONFIG_IIO_BUFFER_CB=y
> # CONFIG_IIO_BUFFER_HW_CONSUMER is not set
> CONFIG_IIO_KFIFO_BUF=y
> CONFIG_IIO_TRIGGERED_BUFFER=y
> CONFIG_IIO_CONFIGFS=y
> CONFIG_IIO_TRIGGER=y
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
> CONFIG_IIO_SW_DEVICE=y
> CONFIG_IIO_SW_TRIGGER=y
> 
> #
> # Accelerometers
> #
> CONFIG_ADIS16201=m
> # CONFIG_ADIS16209 is not set
> CONFIG_ADXL345=m
> CONFIG_ADXL345_I2C=m
> CONFIG_ADXL345_SPI=m
> CONFIG_ADXL372=m
> CONFIG_ADXL372_SPI=m
> CONFIG_ADXL372_I2C=m
> CONFIG_BMA180=m
> CONFIG_BMA220=y
> CONFIG_BMA400=y
> CONFIG_BMA400_I2C=m
> # CONFIG_BMC150_ACCEL is not set
> CONFIG_DA280=m
> CONFIG_DA311=m
> # CONFIG_DMARD06 is not set
> CONFIG_DMARD09=m
> CONFIG_DMARD10=m
> # CONFIG_HID_SENSOR_ACCEL_3D is not set
> CONFIG_IIO_ST_ACCEL_3AXIS=m
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
> CONFIG_IIO_ST_ACCEL_SPI_3AXIS=m
> CONFIG_KXSD9=m
> # CONFIG_KXSD9_SPI is not set
> CONFIG_KXSD9_I2C=m
> CONFIG_KXCJK1013=m
> CONFIG_MC3230=m
> CONFIG_MMA7455=y
> CONFIG_MMA7455_I2C=m
> CONFIG_MMA7455_SPI=y
> CONFIG_MMA7660=m
> CONFIG_MMA8452=m
> CONFIG_MMA9551_CORE=m
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=m
> # CONFIG_MXC4005 is not set
> # CONFIG_MXC6255 is not set
> CONFIG_SCA3000=m
> # CONFIG_STK8312 is not set
> # CONFIG_STK8BA50 is not set
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=y
> # CONFIG_AD7091R5 is not set
> CONFIG_AD7124=y
> CONFIG_AD7266=m
> # CONFIG_AD7291 is not set
> CONFIG_AD7292=m
> CONFIG_AD7298=y
> CONFIG_AD7476=y
> CONFIG_AD7606=m
> # CONFIG_AD7606_IFACE_PARALLEL is not set
> CONFIG_AD7606_IFACE_SPI=m
> # CONFIG_AD7766 is not set
> # CONFIG_AD7768_1 is not set
> CONFIG_AD7780=y
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=y
> CONFIG_AD7887=y
> CONFIG_AD7923=m
> CONFIG_AD7949=y
> CONFIG_AD799X=m
> CONFIG_ASPEED_ADC=m
> # CONFIG_AT91_SAMA5D2_ADC is not set
> CONFIG_BCM_IPROC_ADC=m
> CONFIG_CC10001_ADC=m
> # CONFIG_CPCAP_ADC is not set
> CONFIG_DA9150_GPADC=m
> CONFIG_ENVELOPE_DETECTOR=y
> CONFIG_EXYNOS_ADC=m
> CONFIG_MXS_LRADC_ADC=m
> # CONFIG_FSL_MX25_ADC is not set
> # CONFIG_HI8435 is not set
> CONFIG_HX711=m
> # CONFIG_INA2XX_ADC is not set
> CONFIG_INGENIC_ADC=m
> CONFIG_IMX7D_ADC=m
> CONFIG_LPC18XX_ADC=m
> # CONFIG_LPC32XX_ADC is not set
> CONFIG_LTC2471=m
> # CONFIG_LTC2485 is not set
> CONFIG_LTC2496=y
> # CONFIG_LTC2497 is not set
> # CONFIG_MAX1027 is not set
> CONFIG_MAX11100=y
> # CONFIG_MAX1118 is not set
> # CONFIG_MAX1363 is not set
> # CONFIG_MAX9611 is not set
> CONFIG_MCP320X=m
> CONFIG_MCP3422=m
> CONFIG_MCP3911=m
> # CONFIG_MEDIATEK_MT6577_AUXADC is not set
> # CONFIG_MESON_SARADC is not set
> # CONFIG_NAU7802 is not set
> CONFIG_NPCM_ADC=y
> CONFIG_QCOM_VADC_COMMON=y
> # CONFIG_QCOM_PM8XXX_XOADC is not set
> # CONFIG_QCOM_SPMI_IADC is not set
> CONFIG_QCOM_SPMI_VADC=y
> CONFIG_QCOM_SPMI_ADC5=y
> CONFIG_RCAR_GYRO_ADC=y
> CONFIG_SC27XX_ADC=y
> CONFIG_SPEAR_ADC=y
> # CONFIG_SD_ADC_MODULATOR is not set
> CONFIG_STM32_ADC_CORE=m
> CONFIG_STM32_ADC=m
> # CONFIG_STM32_DFSDM_CORE is not set
> # CONFIG_STM32_DFSDM_ADC is not set
> CONFIG_STMPE_ADC=y
> # CONFIG_STX104 is not set
> CONFIG_TI_ADC081C=m
> # CONFIG_TI_ADC0832 is not set
> # CONFIG_TI_ADC084S021 is not set
> # CONFIG_TI_ADC12138 is not set
> # CONFIG_TI_ADC108S102 is not set
> # CONFIG_TI_ADC128S052 is not set
> CONFIG_TI_ADC161S626=m
> CONFIG_TI_ADS1015=m
> CONFIG_TI_ADS7950=m
> # CONFIG_TI_ADS8344 is not set
> CONFIG_TI_ADS8688=y
> CONFIG_TI_ADS124S08=y
> CONFIG_TI_TLC4541=y
> CONFIG_VF610_ADC=y
> CONFIG_VIPERBOARD_ADC=m
> CONFIG_XILINX_XADC=y
> # end of Analog to digital converters
> 
> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=m
> # end of Analog Front Ends
> 
> #
> # Amplifiers
> #
> CONFIG_AD8366=m
> # end of Amplifiers
> 
> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=m
> CONFIG_BME680=m
> CONFIG_BME680_I2C=m
> CONFIG_BME680_SPI=m
> CONFIG_CCS811=m
> # CONFIG_IAQCORE is not set
> CONFIG_PMS7003=m
> CONFIG_SENSIRION_SGP30=m
> CONFIG_SPS30=m
> # CONFIG_VZ89X is not set
> # end of Chemical Sensors
> 
> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=y
> CONFIG_HID_SENSOR_IIO_TRIGGER=y
> # end of Hid Sensor IIO Common
> 
> CONFIG_IIO_MS_SENSORS_I2C=m
> 
> #
> # SSP Sensor Common
> #
> CONFIG_IIO_SSP_SENSORS_COMMONS=m
> CONFIG_IIO_SSP_SENSORHUB=y
> # end of SSP Sensor Common
> 
> CONFIG_IIO_ST_SENSORS_I2C=m
> CONFIG_IIO_ST_SENSORS_SPI=m
> CONFIG_IIO_ST_SENSORS_CORE=m
> 
> #
> # Digital to analog converters
> #
> CONFIG_AD5064=m
> CONFIG_AD5360=m
> CONFIG_AD5380=m
> # CONFIG_AD5421 is not set
> CONFIG_AD5446=m
> CONFIG_AD5449=y
> CONFIG_AD5592R_BASE=y
> CONFIG_AD5592R=y
> # CONFIG_AD5593R is not set
> CONFIG_AD5504=y
> CONFIG_AD5624R_SPI=y
> CONFIG_LTC1660=y
> CONFIG_LTC2632=y
> CONFIG_AD5686=y
> CONFIG_AD5686_SPI=y
> # CONFIG_AD5696_I2C is not set
> CONFIG_AD5755=m
> CONFIG_AD5758=m
> CONFIG_AD5761=y
> CONFIG_AD5764=m
> # CONFIG_AD5791 is not set
> CONFIG_AD7303=y
> CONFIG_CIO_DAC=y
> # CONFIG_AD8801 is not set
> CONFIG_DPOT_DAC=y
> # CONFIG_DS4424 is not set
> CONFIG_LPC18XX_DAC=m
> CONFIG_M62332=m
> CONFIG_MAX517=m
> CONFIG_MAX5821=m
> # CONFIG_MCP4725 is not set
> # CONFIG_MCP4922 is not set
> CONFIG_STM32_DAC=m
> CONFIG_STM32_DAC_CORE=m
> # CONFIG_TI_DAC082S085 is not set
> CONFIG_TI_DAC5571=m
> CONFIG_TI_DAC7311=y
> # CONFIG_TI_DAC7612 is not set
> # CONFIG_VF610_DAC is not set
> # end of Digital to analog converters
> 
> #
> # IIO dummy driver
> #
> CONFIG_IIO_SIMPLE_DUMMY=y
> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> # end of IIO dummy driver
> 
> #
> # Frequency Synthesizers DDS/PLL
> #
> 
> #
> # Clock Generator/Distribution
> #
> # CONFIG_AD9523 is not set
> # end of Clock Generator/Distribution
> 
> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> CONFIG_ADF4350=y
> CONFIG_ADF4371=y
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> 
> #
> # Digital gyroscope sensors
> #
> # CONFIG_ADIS16080 is not set
> CONFIG_ADIS16130=m
> # CONFIG_ADIS16136 is not set
> CONFIG_ADIS16260=y
> CONFIG_ADXRS450=y
> CONFIG_BMG160=y
> CONFIG_BMG160_I2C=m
> CONFIG_BMG160_SPI=y
> CONFIG_FXAS21002C=m
> CONFIG_FXAS21002C_I2C=m
> CONFIG_FXAS21002C_SPI=m
> CONFIG_HID_SENSOR_GYRO_3D=m
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=m
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
> # CONFIG_ITG3200 is not set
> # end of Digital gyroscope sensors
> 
> #
> # Health Sensors
> #
> 
> #
> # Heart Rate Monitors
> #
> # CONFIG_AFE4403 is not set
> CONFIG_AFE4404=m
> CONFIG_MAX30100=m
> CONFIG_MAX30102=m
> # end of Heart Rate Monitors
> # end of Health Sensors
> 
> #
> # Humidity sensors
> #
> CONFIG_AM2315=m
> CONFIG_DHT11=m
> # CONFIG_HDC100X is not set
> # CONFIG_HID_SENSOR_HUMIDITY is not set
> CONFIG_HTS221=y
> CONFIG_HTS221_I2C=m
> CONFIG_HTS221_SPI=y
> CONFIG_HTU21=m
> CONFIG_SI7005=m
> CONFIG_SI7020=m
> # end of Humidity sensors
> 
> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=y
> # CONFIG_ADIS16460 is not set
> # CONFIG_ADIS16480 is not set
> CONFIG_BMI160=m
> CONFIG_BMI160_I2C=m
> # CONFIG_BMI160_SPI is not set
> CONFIG_FXOS8700=m
> CONFIG_FXOS8700_I2C=m
> CONFIG_FXOS8700_SPI=m
> CONFIG_KMX61=m
> CONFIG_INV_MPU6050_IIO=y
> CONFIG_INV_MPU6050_I2C=m
> CONFIG_INV_MPU6050_SPI=y
> CONFIG_IIO_ST_LSM6DSX=m
> CONFIG_IIO_ST_LSM6DSX_I2C=m
> CONFIG_IIO_ST_LSM6DSX_SPI=m
> CONFIG_IIO_ST_LSM6DSX_I3C=m
> # end of Inertial measurement units
> 
> CONFIG_IIO_ADIS_LIB=y
> CONFIG_IIO_ADIS_LIB_BUFFER=y
> 
> #
> # Light sensors
> #
> # CONFIG_ADJD_S311 is not set
> # CONFIG_ADUX1020 is not set
> CONFIG_AL3320A=m
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=m
> # CONFIG_BH1750 is not set
> CONFIG_BH1780=m
> CONFIG_CM32181=m
> CONFIG_CM3232=m
> CONFIG_CM3323=m
> # CONFIG_CM3605 is not set
> CONFIG_CM36651=m
> CONFIG_GP2AP020A00F=m
> CONFIG_SENSORS_ISL29018=m
> CONFIG_SENSORS_ISL29028=m
> CONFIG_ISL29125=m
> # CONFIG_HID_SENSOR_ALS is not set
> CONFIG_HID_SENSOR_PROX=m
> CONFIG_JSA1212=m
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=m
> CONFIG_LV0104CS=m
> CONFIG_MAX44000=m
> # CONFIG_MAX44009 is not set
> CONFIG_NOA1305=m
> # CONFIG_OPT3001 is not set
> # CONFIG_PA12203001 is not set
> CONFIG_SI1133=m
> CONFIG_SI1145=m
> CONFIG_STK3310=m
> CONFIG_ST_UVIS25=m
> CONFIG_ST_UVIS25_I2C=m
> CONFIG_ST_UVIS25_SPI=m
> # CONFIG_TCS3414 is not set
> CONFIG_TCS3472=m
> # CONFIG_SENSORS_TSL2563 is not set
> # CONFIG_TSL2583 is not set
> CONFIG_TSL2772=m
> CONFIG_TSL4531=m
> CONFIG_US5182D=m
> CONFIG_VCNL4000=m
> # CONFIG_VCNL4035 is not set
> CONFIG_VEML6030=m
> CONFIG_VEML6070=m
> CONFIG_VL6180=m
> CONFIG_ZOPT2201=m
> # end of Light sensors
> 
> #
> # Magnetometer sensors
> #
> CONFIG_AK8974=m
> CONFIG_AK8975=m
> CONFIG_AK09911=m
> CONFIG_BMC150_MAGN=m
> CONFIG_BMC150_MAGN_I2C=m
> CONFIG_BMC150_MAGN_SPI=m
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
> CONFIG_MMC35240=m
> CONFIG_IIO_ST_MAGN_3AXIS=m
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
> # CONFIG_SENSORS_HMC5843_I2C is not set
> # CONFIG_SENSORS_HMC5843_SPI is not set
> # CONFIG_SENSORS_RM3100_I2C is not set
> # CONFIG_SENSORS_RM3100_SPI is not set
> # end of Magnetometer sensors
> 
> #
> # Multiplexers
> #
> CONFIG_IIO_MUX=y
> # end of Multiplexers
> 
> #
> # Inclinometer sensors
> #
> # CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
> CONFIG_HID_SENSOR_DEVICE_ROTATION=m
> # end of Inclinometer sensors
> 
> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=m
> CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
> CONFIG_IIO_STM32_TIMER_TRIGGER=y
> CONFIG_IIO_TIGHTLOOP_TRIGGER=y
> CONFIG_IIO_SYSFS_TRIGGER=m
> # end of Triggers - standalone
> 
> #
> # Digital potentiometers
> #
> CONFIG_AD5272=m
> # CONFIG_DS1803 is not set
> CONFIG_MAX5432=m
> CONFIG_MAX5481=m
> CONFIG_MAX5487=m
> CONFIG_MCP4018=m
> CONFIG_MCP4131=y
> CONFIG_MCP4531=m
> # CONFIG_MCP41010 is not set
> CONFIG_TPL0102=m
> # end of Digital potentiometers
> 
> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=m
> # end of Digital potentiostats
> 
> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=m
> CONFIG_BMP280=m
> CONFIG_BMP280_I2C=m
> CONFIG_BMP280_SPI=m
> # CONFIG_DLHL60D is not set
> CONFIG_DPS310=m
> CONFIG_HID_SENSOR_PRESS=y
> CONFIG_HP03=m
> CONFIG_MPL115=m
> CONFIG_MPL115_I2C=m
> CONFIG_MPL115_SPI=m
> CONFIG_MPL3115=m
> CONFIG_MS5611=m
> CONFIG_MS5611_I2C=m
> # CONFIG_MS5611_SPI is not set
> CONFIG_MS5637=m
> # CONFIG_IIO_ST_PRESS is not set
> # CONFIG_T5403 is not set
> CONFIG_HP206C=m
> # CONFIG_ZPA2326 is not set
> # end of Pressure sensors
> 
> #
> # Lightning sensors
> #
> # CONFIG_AS3935 is not set
> # end of Lightning sensors
> 
> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=m
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_MB1232=m
> # CONFIG_PING is not set
> CONFIG_RFD77402=m
> CONFIG_SRF04=y
> CONFIG_SX9500=m
> CONFIG_SRF08=m
> CONFIG_VL53L0X_I2C=m
> # end of Proximity and distance sensors
> 
> #
> # Resolver to digital converters
> #
> # CONFIG_AD2S90 is not set
> CONFIG_AD2S1200=y
> # end of Resolver to digital converters
> 
> #
> # Temperature sensors
> #
> CONFIG_LTC2983=y
> CONFIG_MAXIM_THERMOCOUPLE=m
> CONFIG_HID_SENSOR_TEMP=m
> CONFIG_MLX90614=m
> CONFIG_MLX90632=m
> CONFIG_TMP006=m
> # CONFIG_TMP007 is not set
> CONFIG_TSYS01=m
> CONFIG_TSYS02D=m
> CONFIG_MAX31856=m
> # end of Temperature sensors
> 
> CONFIG_NTB=m
> CONFIG_NTB_IDT=m
> CONFIG_NTB_SWITCHTEC=m
> # CONFIG_NTB_PINGPONG is not set
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> CONFIG_NTB_TRANSPORT=m
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=y
> CONFIG_PWM_SYSFS=y
> CONFIG_PWM_BCM_IPROC=m
> CONFIG_PWM_BCM_KONA=y
> CONFIG_PWM_CLPS711X=y
> CONFIG_PWM_FSL_FTM=y
> # CONFIG_PWM_HIBVT is not set
> # CONFIG_PWM_IMG is not set
> CONFIG_PWM_IMX_TPM=m
> # CONFIG_PWM_LPSS_PCI is not set
> CONFIG_PWM_MTK_DISP=y
> CONFIG_PWM_MEDIATEK=m
> CONFIG_PWM_OMAP_DMTIMER=y
> # CONFIG_PWM_PCA9685 is not set
> CONFIG_PWM_RCAR=y
> CONFIG_PWM_RENESAS_TPU=m
> CONFIG_PWM_SIFIVE=y
> CONFIG_PWM_SPRD=m
> # CONFIG_PWM_STM32 is not set
> CONFIG_PWM_STM32_LP=y
> # CONFIG_PWM_STMPE is not set
> CONFIG_PWM_SUN4I=m
> 
> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=y
> # CONFIG_AL_FIC is not set
> CONFIG_MADERA_IRQ=y
> CONFIG_JCORE_AIC=y
> CONFIG_RENESAS_INTC_IRQPIN=y
> CONFIG_RENESAS_IRQC=y
> # CONFIG_RENESAS_RZA1_IRQC is not set
> CONFIG_TS4800_IRQ=m
> # CONFIG_INGENIC_TCU_IRQ is not set
> CONFIG_RENESAS_H8S_INTC=y
> # CONFIG_EZNPS_GIC is not set
> CONFIG_IRQ_UNIPHIER_AIDET=y
> # CONFIG_IMX_IRQSTEER is not set
> CONFIG_IMX_INTMUX=y
> # CONFIG_EXYNOS_IRQ_COMBINER is not set
> # end of IRQ chip support
> 
> CONFIG_IPACK_BUS=m
> # CONFIG_BOARD_TPCI200 is not set
> CONFIG_RESET_CONTROLLER=y
> CONFIG_RESET_ATH79=y
> # CONFIG_RESET_AXS10X is not set
> CONFIG_RESET_BERLIN=y
> # CONFIG_RESET_BRCMSTB is not set
> CONFIG_RESET_BRCMSTB_RESCAL=y
> CONFIG_RESET_HSDK=y
> # CONFIG_RESET_IMX7 is not set
> # CONFIG_RESET_INTEL_GW is not set
> CONFIG_RESET_LANTIQ=y
> CONFIG_RESET_LPC18XX=y
> # CONFIG_RESET_MESON is not set
> # CONFIG_RESET_MESON_AUDIO_ARB is not set
> CONFIG_RESET_NPCM=y
> # CONFIG_RESET_PISTACHIO is not set
> CONFIG_RESET_QCOM_AOSS=m
> # CONFIG_RESET_QCOM_PDC is not set
> CONFIG_RESET_SCMI=y
> CONFIG_RESET_SIMPLE=y
> # CONFIG_RESET_STM32MP157 is not set
> CONFIG_RESET_SOCFPGA=y
> CONFIG_RESET_SUNXI=y
> CONFIG_RESET_TI_SYSCON=y
> # CONFIG_RESET_UNIPHIER is not set
> CONFIG_RESET_UNIPHIER_GLUE=y
> # CONFIG_RESET_ZYNQ is not set
> CONFIG_COMMON_RESET_HI3660=m
> CONFIG_COMMON_RESET_HI6220=m
> 
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> CONFIG_PHY_LPC18XX_USB_OTG=m
> CONFIG_PHY_XGENE=y
> CONFIG_PHY_SUN4I_USB=m
> # CONFIG_PHY_SUN6I_MIPI_DPHY is not set
> CONFIG_PHY_SUN9I_USB=m
> # CONFIG_PHY_SUN50I_USB3 is not set
> # CONFIG_PHY_MESON8B_USB2 is not set
> # CONFIG_PHY_MESON_GXL_USB2 is not set
> # CONFIG_PHY_MESON_GXL_USB3 is not set
> # CONFIG_PHY_MESON_G12A_USB2 is not set
> # CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
> # CONFIG_PHY_MESON_AXG_PCIE is not set
> CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=m
> CONFIG_PHY_CYGNUS_PCIE=m
> CONFIG_PHY_BCM_SR_USB=y
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_BCM_NS_USB2=y
> # CONFIG_PHY_NS2_USB_DRD is not set
> CONFIG_PHY_BRCM_SATA=y
> CONFIG_PHY_BRCM_USB=m
> CONFIG_PHY_BCM_SR_PCIE=m
> CONFIG_PHY_CADENCE_TORRENT=y
> CONFIG_PHY_CADENCE_DPHY=m
> CONFIG_PHY_CADENCE_SIERRA=m
> CONFIG_PHY_FSL_IMX8MQ_USB=y
> CONFIG_PHY_MIXEL_MIPI_DPHY=y
> # CONFIG_PHY_HI6220_USB is not set
> # CONFIG_PHY_HI3660_USB is not set
> # CONFIG_PHY_HISTB_COMBPHY is not set
> CONFIG_PHY_HISI_INNO_USB2=y
> CONFIG_PHY_LANTIQ_VRX200_PCIE=m
> CONFIG_PHY_LANTIQ_RCU_USB2=m
> CONFIG_ARMADA375_USBCLUSTER_PHY=y
> CONFIG_PHY_BERLIN_SATA=m
> # CONFIG_PHY_BERLIN_USB is not set
> # CONFIG_PHY_MVEBU_A3700_UTMI is not set
> CONFIG_PHY_MVEBU_A38X_COMPHY=m
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> CONFIG_PHY_PXA_28NM_USB2=y
> # CONFIG_PHY_PXA_USB is not set
> CONFIG_PHY_MMP3_USB=m
> # CONFIG_PHY_MTK_TPHY is not set
> CONFIG_PHY_MTK_UFS=m
> # CONFIG_PHY_MTK_XSPHY is not set
> CONFIG_PHY_CPCAP_USB=m
> # CONFIG_PHY_MAPPHONE_MDM6600 is not set
> CONFIG_PHY_OCELOT_SERDES=y
> # CONFIG_PHY_ATH79_USB is not set
> CONFIG_PHY_QCOM_PCIE2=y
> CONFIG_PHY_QCOM_QMP=y
> CONFIG_PHY_QCOM_QUSB2=y
> CONFIG_PHY_QCOM_USB_HS=y
> # CONFIG_PHY_QCOM_USB_HSIC is not set
> CONFIG_PHY_RALINK_USB=y
> CONFIG_PHY_RCAR_GEN3_USB3=m
> CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
> # CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
> CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
> CONFIG_PHY_ROCKCHIP_PCIE=y
> CONFIG_PHY_ROCKCHIP_TYPEC=m
> CONFIG_PHY_EXYNOS_DP_VIDEO=m
> CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
> CONFIG_PHY_EXYNOS_PCIE=y
> CONFIG_PHY_SAMSUNG_USB2=m
> CONFIG_PHY_S5PV210_USB2=y
> # CONFIG_PHY_EXYNOS5_USBDRD is not set
> # CONFIG_PHY_UNIPHIER_USB2 is not set
> CONFIG_PHY_UNIPHIER_USB3=m
> CONFIG_PHY_UNIPHIER_PCIE=y
> CONFIG_PHY_ST_SPEAR1310_MIPHY=m
> # CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
> CONFIG_PHY_STIH407_USB=y
> CONFIG_PHY_STM32_USBPHYC=m
> CONFIG_PHY_TEGRA194_P2U=m
> # CONFIG_PHY_DA8XX_USB is not set
> CONFIG_PHY_DM816X_USB=y
> # CONFIG_PHY_AM654_SERDES is not set
> CONFIG_PHY_J721E_WIZ=m
> CONFIG_OMAP_CONTROL_PHY=y
> CONFIG_TI_PIPE3=y
> CONFIG_PHY_TUSB1210=m
> CONFIG_PHY_TI_GMII_SEL=m
> # CONFIG_PHY_INTEL_EMMC is not set
> # end of PHY Subsystem
> 
> CONFIG_POWERCAP=y
> CONFIG_INTEL_RAPL_CORE=m
> CONFIG_INTEL_RAPL=m
> # CONFIG_IDLE_INJECT is not set
> # CONFIG_MCB is not set
> 
> #
> # Performance monitor support
> #
> # end of Performance monitor support
> 
> CONFIG_RAS=y
> CONFIG_USB4=y
> 
> #
> # Android
> #
> CONFIG_ANDROID=y
> # CONFIG_ANDROID_BINDER_IPC is not set
> # end of Android
> 
> CONFIG_DAX=m
> # CONFIG_DEV_DAX is not set
> CONFIG_NVMEM=y
> CONFIG_NVMEM_SYSFS=y
> # CONFIG_NVMEM_IMX_IIM is not set
> CONFIG_NVMEM_IMX_OCOTP=y
> # CONFIG_JZ4780_EFUSE is not set
> CONFIG_NVMEM_LPC18XX_EEPROM=y
> CONFIG_NVMEM_LPC18XX_OTP=m
> CONFIG_NVMEM_MXS_OCOTP=m
> CONFIG_MTK_EFUSE=m
> CONFIG_QCOM_QFPROM=y
> CONFIG_NVMEM_SPMI_SDAM=y
> # CONFIG_ROCKCHIP_EFUSE is not set
> CONFIG_ROCKCHIP_OTP=y
> CONFIG_NVMEM_BCM_OCOTP=m
> CONFIG_NVMEM_STM32_ROMEM=m
> CONFIG_UNIPHIER_EFUSE=y
> # CONFIG_NVMEM_VF610_OCOTP is not set
> CONFIG_MESON_MX_EFUSE=y
> CONFIG_NVMEM_SNVS_LPGPR=m
> CONFIG_RAVE_SP_EEPROM=m
> CONFIG_SC27XX_EFUSE=y
> # CONFIG_SPRD_EFUSE is not set
> 
> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> # CONFIG_INTEL_TH is not set
> # end of HW tracing support
> 
> CONFIG_FPGA=m
> CONFIG_FPGA_MGR_SOCFPGA=m
> # CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
> CONFIG_ALTERA_PR_IP_CORE=m
> CONFIG_ALTERA_PR_IP_CORE_PLAT=m
> CONFIG_FPGA_MGR_ALTERA_PS_SPI=m
> CONFIG_FPGA_MGR_ALTERA_CVP=m
> CONFIG_FPGA_MGR_ZYNQ_FPGA=m
> CONFIG_FPGA_MGR_XILINX_SPI=m
> CONFIG_FPGA_MGR_ICE40_SPI=m
> # CONFIG_FPGA_MGR_MACHXO2_SPI is not set
> CONFIG_FPGA_BRIDGE=m
> # CONFIG_ALTERA_FREEZE_BRIDGE is not set
> # CONFIG_XILINX_PR_DECOUPLER is not set
> CONFIG_FPGA_REGION=m
> # CONFIG_OF_FPGA_REGION is not set
> CONFIG_FPGA_DFL=m
> # CONFIG_FPGA_DFL_FME is not set
> CONFIG_FPGA_DFL_AFU=m
> CONFIG_FPGA_DFL_PCI=m
> CONFIG_FPGA_MGR_ZYNQMP_FPGA=m
> CONFIG_FSI=m
> CONFIG_FSI_NEW_DEV_NODE=y
> CONFIG_FSI_MASTER_GPIO=m
> CONFIG_FSI_MASTER_HUB=m
> # CONFIG_FSI_MASTER_ASPEED is not set
> # CONFIG_FSI_SCOM is not set
> # CONFIG_FSI_SBEFIFO is not set
> CONFIG_TEE=m
> 
> #
> # TEE drivers
> #
> # end of TEE drivers
> 
> CONFIG_MULTIPLEXER=y
> 
> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=m
> CONFIG_MUX_ADGS1408=m
> CONFIG_MUX_GPIO=m
> CONFIG_MUX_MMIO=y
> # end of Multiplexer drivers
> 
> CONFIG_PM_OPP=y
> CONFIG_SIOX=y
> CONFIG_SIOX_BUS_GPIO=m
> CONFIG_SLIMBUS=y
> CONFIG_SLIM_QCOM_CTRL=y
> CONFIG_INTERCONNECT=m
> # CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
> CONFIG_COUNTER=y
> # CONFIG_104_QUAD_8 is not set
> # CONFIG_STM32_TIMER_CNT is not set
> CONFIG_STM32_LPTIMER_CNT=y
> CONFIG_TI_EQEP=m
> # CONFIG_FTM_QUADDEC is not set
> # end of Device Drivers
> 
> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=y
> CONFIG_VALIDATE_FS_PARSER=y
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> # CONFIG_FILE_LOCKING is not set
> CONFIG_FS_ENCRYPTION=y
> CONFIG_FS_VERITY=y
> # CONFIG_FS_VERITY_DEBUG is not set
> CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
> CONFIG_FSNOTIFY=y
> CONFIG_DNOTIFY=y
> # CONFIG_INOTIFY_USER is not set
> CONFIG_FANOTIFY=y
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=m
> CONFIG_AUTOFS_FS=m
> CONFIG_FUSE_FS=y
> CONFIG_CUSE=y
> CONFIG_VIRTIO_FS=y
> CONFIG_OVERLAY_FS=m
> CONFIG_OVERLAY_FS_REDIRECT_DIR=y
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> CONFIG_OVERLAY_FS_METACOPY=y
> 
> #
> # Caches
> #
> CONFIG_FSCACHE=y
> # CONFIG_FSCACHE_DEBUG is not set
> # end of Caches
> 
> #
> # Pseudo filesystems
> #
> # CONFIG_PROC_FS is not set
> CONFIG_PROC_CHILDREN=y
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_TMPFS=y
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> # CONFIG_HUGETLBFS is not set
> CONFIG_MEMFD_CREATE=y
> CONFIG_CONFIGFS_FS=y
> # end of Pseudo filesystems
> 
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=m
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=y
> # CONFIG_NLS_CODEPAGE_850 is not set
> CONFIG_NLS_CODEPAGE_852=y
> CONFIG_NLS_CODEPAGE_855=y
> CONFIG_NLS_CODEPAGE_857=m
> # CONFIG_NLS_CODEPAGE_860 is not set
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> # CONFIG_NLS_CODEPAGE_863 is not set
> CONFIG_NLS_CODEPAGE_864=y
> CONFIG_NLS_CODEPAGE_865=y
> CONFIG_NLS_CODEPAGE_866=y
> CONFIG_NLS_CODEPAGE_869=y
> CONFIG_NLS_CODEPAGE_936=m
> CONFIG_NLS_CODEPAGE_950=y
> CONFIG_NLS_CODEPAGE_932=m
> CONFIG_NLS_CODEPAGE_949=m
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=y
> CONFIG_NLS_CODEPAGE_1250=m
> # CONFIG_NLS_CODEPAGE_1251 is not set
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=y
> # CONFIG_NLS_ISO8859_2 is not set
> CONFIG_NLS_ISO8859_3=y
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=m
> CONFIG_NLS_ISO8859_7=m
> CONFIG_NLS_ISO8859_9=y
> CONFIG_NLS_ISO8859_13=y
> CONFIG_NLS_ISO8859_14=m
> CONFIG_NLS_ISO8859_15=m
> CONFIG_NLS_KOI8_R=y
> CONFIG_NLS_KOI8_U=y
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=y
> CONFIG_NLS_MAC_CROATIAN=m
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=y
> CONFIG_NLS_MAC_GREEK=m
> CONFIG_NLS_MAC_ICELAND=m
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=y
> # CONFIG_NLS_UTF8 is not set
> CONFIG_UNICODE=y
> CONFIG_UNICODE_NORMALIZATION_SELFTEST=m
> # end of File systems
> 
> #
> # Security options
> #
> CONFIG_KEYS=y
> CONFIG_KEYS_REQUEST_CACHE=y
> CONFIG_PERSISTENT_KEYRINGS=y
> CONFIG_BIG_KEYS=y
> # CONFIG_ENCRYPTED_KEYS is not set
> CONFIG_KEY_DH_OPERATIONS=y
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> # CONFIG_SECURITY is not set
> # CONFIG_SECURITYFS is not set
> CONFIG_PAGE_TABLE_ISOLATION=y
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> CONFIG_HARDENED_USERCOPY=y
> # CONFIG_HARDENED_USERCOPY_FALLBACK is not set
> CONFIG_HARDENED_USERCOPY_PAGESPAN=y
> CONFIG_FORTIFY_SOURCE=y
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_DEFAULT_SECURITY_DAC=y
> CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity"
> 
> #
> # Kernel hardening options
> #
> 
> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=y
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> 
> CONFIG_CRYPTO=y
> 
> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> CONFIG_CRYPTO_GF128MUL=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_CRYPTD=y
> CONFIG_CRYPTO_AUTHENC=m
> CONFIG_CRYPTO_TEST=m
> CONFIG_CRYPTO_SIMD=y
> 
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> # CONFIG_CRYPTO_ECDH is not set
> # CONFIG_CRYPTO_ECRDSA is not set
> CONFIG_CRYPTO_CURVE25519=m
> 
> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
> CONFIG_CRYPTO_GCM=y
> CONFIG_CRYPTO_CHACHA20POLY1305=m
> # CONFIG_CRYPTO_AEGIS128 is not set
> CONFIG_CRYPTO_SEQIV=y
> # CONFIG_CRYPTO_ECHAINIV is not set
> 
> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=m
> CONFIG_CRYPTO_CFB=m
> CONFIG_CRYPTO_CTR=y
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=y
> # CONFIG_CRYPTO_LRW is not set
> CONFIG_CRYPTO_OFB=y
> CONFIG_CRYPTO_PCBC=m
> CONFIG_CRYPTO_XTS=m
> # CONFIG_CRYPTO_KEYWRAP is not set
> CONFIG_CRYPTO_NHPOLY1305=m
> CONFIG_CRYPTO_ADIANTUM=m
> CONFIG_CRYPTO_ESSIV=m
> 
> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=y
> CONFIG_CRYPTO_XCBC=y
> CONFIG_CRYPTO_VMAC=y
> 
> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=y
> CONFIG_CRYPTO_CRC32C_INTEL=y
> CONFIG_CRYPTO_CRC32=y
> CONFIG_CRYPTO_CRC32_PCLMUL=m
> CONFIG_CRYPTO_XXHASH=m
> CONFIG_CRYPTO_BLAKE2B=m
> CONFIG_CRYPTO_BLAKE2S=y
> CONFIG_CRYPTO_CRCT10DIF=y
> CONFIG_CRYPTO_GHASH=y
> CONFIG_CRYPTO_POLY1305=m
> CONFIG_CRYPTO_MD4=y
> # CONFIG_CRYPTO_MD5 is not set
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=m
> CONFIG_CRYPTO_RMD256=m
> CONFIG_CRYPTO_RMD320=y
> # CONFIG_CRYPTO_SHA1 is not set
> CONFIG_CRYPTO_SHA256=y
> # CONFIG_CRYPTO_SHA512 is not set
> CONFIG_CRYPTO_SHA3=m
> CONFIG_CRYPTO_SM3=y
> CONFIG_CRYPTO_STREEBOG=m
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
> 
> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=y
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_NI_INTEL=y
> # CONFIG_CRYPTO_ANUBIS is not set
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=y
> CONFIG_CRYPTO_BLOWFISH_COMMON=y
> CONFIG_CRYPTO_CAMELLIA=y
> CONFIG_CRYPTO_CAST_COMMON=y
> CONFIG_CRYPTO_CAST5=y
> # CONFIG_CRYPTO_CAST6 is not set
> CONFIG_CRYPTO_DES=y
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=m
> CONFIG_CRYPTO_CHACHA20=m
> CONFIG_CRYPTO_SEED=y
> CONFIG_CRYPTO_SERPENT=m
> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> # CONFIG_CRYPTO_SM4 is not set
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=m
> CONFIG_CRYPTO_TWOFISH_COMMON=m
> CONFIG_CRYPTO_TWOFISH_586=m
> 
> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=m
> # CONFIG_CRYPTO_LZO is not set
> CONFIG_CRYPTO_842=m
> CONFIG_CRYPTO_LZ4=m
> CONFIG_CRYPTO_LZ4HC=m
> # CONFIG_CRYPTO_ZSTD is not set
> 
> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=y
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> CONFIG_CRYPTO_DRBG_HASH=y
> CONFIG_CRYPTO_DRBG_CTR=y
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> CONFIG_CRYPTO_HASH_INFO=y
> 
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_LIB_BLAKE2S=m
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
> CONFIG_CRYPTO_LIB_CURVE25519=m
> CONFIG_CRYPTO_LIB_DES=y
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> CONFIG_CRYPTO_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
> CONFIG_CRYPTO_LIB_SHA256=y
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=y
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
> CONFIG_X509_CERTIFICATE_PARSER=y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
> CONFIG_PKCS7_MESSAGE_PARSER=y
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=y
> 
> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=y
> CONFIG_SYSTEM_TRUSTED_KEYS=""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=y
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
> # end of Certificates for signature checking
> 
> #
> # Library routines
> #
> CONFIG_PACKING=y
> CONFIG_BITREVERSE=y
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> CONFIG_GENERIC_FIND_FIRST_BIT=y
> # CONFIG_CORDIC is not set
> CONFIG_PRIME_NUMBERS=m
> CONFIG_RATIONAL=y
> CONFIG_GENERIC_PCI_IOMAP=y
> CONFIG_GENERIC_IOMAP=y
> CONFIG_STMP_DEVICE=y
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
> CONFIG_CRC_CCITT=m
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> CONFIG_CRC_ITU_T=m
> CONFIG_CRC32=y
> CONFIG_CRC32_SELFTEST=y
> CONFIG_CRC32_SLICEBY8=y
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> CONFIG_CRC4=m
> CONFIG_CRC7=y
> # CONFIG_LIBCRC32C is not set
> CONFIG_CRC8=y
> CONFIG_XXHASH=y
> CONFIG_RANDOM32_SELFTEST=y
> CONFIG_842_COMPRESS=m
> CONFIG_842_DECOMPRESS=m
> CONFIG_ZLIB_INFLATE=m
> CONFIG_ZLIB_DEFLATE=m
> CONFIG_LZ4_COMPRESS=m
> CONFIG_LZ4HC_COMPRESS=m
> CONFIG_LZ4_DECOMPRESS=m
> CONFIG_XZ_DEC=y
> # CONFIG_XZ_DEC_X86 is not set
> CONFIG_XZ_DEC_POWERPC=y
> # CONFIG_XZ_DEC_IA64 is not set
> CONFIG_XZ_DEC_ARM=y
> CONFIG_XZ_DEC_ARMTHUMB=y
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=y
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_REED_SOLOMON=m
> CONFIG_REED_SOLOMON_ENC16=y
> CONFIG_REED_SOLOMON_DEC16=y
> CONFIG_INTERVAL_TREE=y
> CONFIG_XARRAY_MULTI=y
> CONFIG_ASSOCIATIVE_ARRAY=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> CONFIG_NEED_SG_DMA_LENGTH=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> CONFIG_SWIOTLB=y
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_SGL_ALLOC=y
> CONFIG_GLOB=y
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_CLZ_TAB=y
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=y
> CONFIG_LIBFDT=y
> CONFIG_OID_REGISTRY=y
> CONFIG_HAVE_GENERIC_VDSO=y
> CONFIG_GENERIC_GETTIMEOFDAY=y
> CONFIG_GENERIC_VDSO_32=y
> CONFIG_GENERIC_VDSO_TIME_NS=y
> CONFIG_ARCH_STACKWALK=y
> CONFIG_STACKDEPOT=y
> CONFIG_PARMAN=y
> # CONFIG_OBJAGG is not set
> CONFIG_STRING_SELFTEST=y
> # end of Library routines
> 
> #
> # Kernel hacking
> #
> 
> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=y
> CONFIG_PRINTK_CALLER=y
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> CONFIG_BOOT_PRINTK_DELAY=y
> CONFIG_DYNAMIC_DEBUG=y
> # CONFIG_SYMBOLIC_ERRNAME is not set
> # CONFIG_DEBUG_BUGVERBOSE is not set
> # end of printk and dmesg options
> 
> #
> # Compile-time checks and compiler options
> #
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=1024
> CONFIG_STRIP_ASM_SYMS=y
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_OPTIMIZE_INLINING=y
> CONFIG_DEBUG_SECTION_MISMATCH=y
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> CONFIG_FRAME_POINTER=y
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> 
> #
> # Generic Kernel Debugging Instruments
> #
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_FS=y
> CONFIG_HAVE_ARCH_KGDB=y
> CONFIG_KGDB=y
> CONFIG_KGDB_TESTS=y
> # CONFIG_KGDB_TESTS_ON_BOOT is not set
> # CONFIG_KGDB_LOW_LEVEL_TRAP is not set
> CONFIG_KGDB_KDB=y
> CONFIG_KDB_DEFAULT_ENABLE=0x1
> CONFIG_KDB_CONTINUE_CATASTROPHIC=0
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> # CONFIG_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> 
> CONFIG_DEBUG_KERNEL=y
> CONFIG_DEBUG_MISC=y
> 
> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=y
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_OWNER=y
> CONFIG_PAGE_POISONING=y
> # CONFIG_PAGE_POISONING_NO_SANITY is not set
> CONFIG_PAGE_POISONING_ZERO=y
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_GENERIC_PTDUMP=y
> CONFIG_PTDUMP_CORE=y
> CONFIG_PTDUMP_DEBUGFS=y
> CONFIG_DEBUG_OBJECTS=y
> CONFIG_DEBUG_OBJECTS_SELFTEST=y
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
> # CONFIG_SLUB_DEBUG_ON is not set
> CONFIG_SLUB_STATS=y
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=y
> CONFIG_SCHED_STACK_END_CHECK=y
> CONFIG_DEBUG_VM=y
> # CONFIG_DEBUG_VM_VMACACHE is not set
> # CONFIG_DEBUG_VM_RB is not set
> # CONFIG_DEBUG_VM_PGFLAGS is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
> CONFIG_DEBUG_STACKOVERFLOW=y
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_KASAN_STACK=1
> # end of Memory Debugging
> 
> # CONFIG_DEBUG_SHIRQ is not set
> 
> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=y
> CONFIG_PANIC_ON_OOPS_VALUE=1
> CONFIG_PANIC_TIMEOUT=0
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=1
> # CONFIG_WQ_WATCHDOG is not set
> CONFIG_TEST_LOCKUP=m
> # end of Debug Oops, Lockups and Hangs
> 
> #
> # Scheduler Debugging
> #
> # end of Scheduler Debugging
> 
> CONFIG_DEBUG_TIMEKEEPING=y
> CONFIG_DEBUG_PREEMPT=y
> 
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> CONFIG_DEBUG_LOCKDEP=y
> # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> 
> CONFIG_STACKTRACE=y
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> 
> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=y
> CONFIG_DEBUG_PLIST=y
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=y
> # end of Debug kernel data structures
> 
> # CONFIG_DEBUG_CREDENTIALS is not set
> 
> #
> # RCU Debugging
> #
> # CONFIG_RCU_PERF_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=21
> CONFIG_RCU_TRACE=y
> CONFIG_RCU_EQS_DEBUG=y
> # end of RCU Debugging
> 
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_USER_STACKTRACE_SUPPORT=y
> CONFIG_HAVE_FUNCTION_TRACER=y
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_HAVE_C_RECORDMCOUNT=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_TRACING_SUPPORT=y
> # CONFIG_FTRACE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_SAMPLES=y
> # CONFIG_SAMPLE_KOBJECT is not set
> CONFIG_SAMPLE_KPROBES=m
> CONFIG_SAMPLE_KRETPROBES=m
> # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> CONFIG_SAMPLE_KFIFO=m
> CONFIG_SAMPLE_KDB=m
> CONFIG_SAMPLE_RPMSG_CLIENT=m
> # CONFIG_SAMPLE_CONFIGFS is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
> CONFIG_SAMPLE_INTEL_MEI=y
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
> CONFIG_STRICT_DEVMEM=y
> # CONFIG_IO_STRICT_DEVMEM is not set
> 
> #
> # x86 Debugging
> #
> CONFIG_DEBUG_AID_FOR_SYZBOT=y
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_X86_VERBOSE_BOOTUP=y
> CONFIG_EARLY_PRINTK=y
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> CONFIG_DEBUG_WX=y
> CONFIG_DOUBLEFAULT=y
> CONFIG_DEBUG_TLBFLUSH=y
> CONFIG_HAVE_MMIOTRACE_SUPPORT=y
> CONFIG_IO_DELAY_0X80=y
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=y
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_FPU=y
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_FRAME_POINTER=y
> # end of x86 Debugging
> 
> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=y
> CONFIG_KUNIT_TEST=m
> # CONFIG_KUNIT_EXAMPLE_TEST is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=y
> CONFIG_PM_NOTIFIER_ERROR_INJECT=y
> CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
> CONFIG_FUNCTION_ERROR_INJECTION=y
> CONFIG_FAULT_INJECTION=y
> # CONFIG_FAILSLAB is not set
> # CONFIG_FAIL_PAGE_ALLOC is not set
> # CONFIG_FAIL_FUTEX is not set
> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> CONFIG_RUNTIME_TESTING_MENU=y
> CONFIG_LKDTM=y
> CONFIG_TEST_LIST_SORT=m
> # CONFIG_TEST_MIN_HEAP is not set
> CONFIG_TEST_SORT=m
> # CONFIG_KPROBES_SANITY_TEST is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> CONFIG_REED_SOLOMON_TEST=m
> CONFIG_INTERVAL_TREE_TEST=m
> CONFIG_PERCPU_TEST=m
> # CONFIG_ATOMIC64_SELFTEST is not set
> CONFIG_TEST_HEXDUMP=m
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_STRSCPY=y
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=y
> CONFIG_TEST_BITMAP=m
> # CONFIG_TEST_BITFIELD is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> CONFIG_TEST_OVERFLOW=y
> CONFIG_TEST_RHASHTABLE=m
> # CONFIG_TEST_HASH is not set
> CONFIG_TEST_IDA=y
> # CONFIG_TEST_PARMAN is not set
> CONFIG_TEST_LKM=m
> # CONFIG_TEST_VMALLOC is not set
> CONFIG_TEST_USER_COPY=m
> CONFIG_FIND_BIT_BENCHMARK=m
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_SYSCTL_KUNIT_TEST is not set
> # CONFIG_LIST_KUNIT_TEST is not set
> # CONFIG_TEST_UDELAY is not set
> CONFIG_TEST_STATIC_KEYS=m
> CONFIG_TEST_MEMCAT_P=y
> # CONFIG_TEST_STACKINIT is not set
> CONFIG_TEST_MEMINIT=m
> CONFIG_MEMTEST=y
> # end of Kernel Testing and Coverage
> # end of Kernel hacking
> 
> CONFIG_WARN_MISSING_DOCUMENTS=y

