Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4CA287FED
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 03:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgJIBSe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 21:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32800 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725979AbgJIBSd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 21:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602206310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4lH8oiEgQB+zn5JmZ1nyNfTX40WSpL9FTUeNnDvrsPU=;
        b=WP7jqqgIYx10gG9iHnVUEQF5Nw9TU7yoX7oMpWLVBnUqMixjdGSp/d5i8KB5dMt0vn9uBJ
        w6xJY4luXhwCCPc5F1Jm7GzgeC0rUS6QVtkq7Qnfh4+pq6zPZtfQieF3xbyavCCJc/fdzu
        M68s5Hu+00PRQOwsaQrGKF6G5sggq4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-iAyFR4WbN3uo8PiBoNJdRw-1; Thu, 08 Oct 2020 21:18:28 -0400
X-MC-Unique: iAyFR4WbN3uo8PiBoNJdRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C23080401A;
        Fri,  9 Oct 2020 01:18:26 +0000 (UTC)
Received: from ovpn-66-175.rdu2.redhat.com (unknown [10.10.67.175])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45B8E6EF61;
        Fri,  9 Oct 2020 01:18:25 +0000 (UTC)
Message-ID: <711bc57a314d8d646b41307008db2845b7537b3d.camel@redhat.com>
Subject: Re: [PATCHv2] arm64: initialize per-cpu offsets earlier
From:   Qian Cai <cai@redhat.com>
To:     Mark Rutland <mark.rutland@arm.com>, will@kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 08 Oct 2020 21:18:24 -0400
In-Reply-To: <20201005164303.21389-1-mark.rutland@arm.com>
References: <20201005164303.21389-1-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-10-05 at 17:43 +0100, Mark Rutland wrote:
> The current initialization of the per-cpu offset register is difficult
> to follow and this initialization is not always early enough for
> upcoming instrumentation with KCSAN, where the instrumentation callbacks
> use the per-cpu offset.
> 
> To make it possible to support KCSAN, and to simplify reasoning about
> early bringup code, let's initialize the per-cpu offset earlier, before
> we run any C code that may consume it. To do so, this patch adds a new
> init_this_cpu_offset() helper that's called before the usual
> primary/secondary start functions. For consistency, this is also used to
> re-initialize the per-cpu offset after the runtime per-cpu areas have
> been allocated (which can change CPU0's offset).
> 
> So that init_this_cpu_offset() isn't subject to any instrumentation that
> might consume the per-cpu offset, it is marked with noinstr, preventing
> instrumentation.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Will Deacon <will@kernel.org>

Reverting this commit on the top of today's linux-next fixed an issue that
Thunder X2 is unable to boot:

.config: https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config

EFI stub: Booting Linux Kernel...
EFI stub: EFI_RNG_PROTOCOL unavailable, KASLR will be disabled
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services and installing virtual address map...

It hangs here for more than 10 minutes even with "earlycon" before I gave up.
The reverting makes it boot again following by those lines almost immediately.

[    0.000000][    T0] Booting Linux on physical CPU 0x0000000000 [0x431f0af1]
[    0.000000][    T0] Linux version 5.9.0-rc8-next-20201008+ (gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5), GNU ld version 2.30-79.el8) #6 SMP Thu Oct 8 20:57:40 EDT 2020
[    0.000000][    T0] efi: EFI v2.70 by American Megatrends
[    0.000000][    T0] efi: ESRT=0xf9224418 SMBIOS=0xfcca0000 SMBIOS 3.0=0xfcc90000 ACPI 2.0=0xf9720000 MEMRESERVE=0xfc965918 
[    0.000000][    T0] esrt: Reserving ESRT space from 0x00000000f9224418 to 0x00000000f9224450.
[    0.000000][    T0] ACPI: Early table checksum verification disabled
[    0.000000][    T0] ACPI: RSDP 0x00000000F9720000 000024 (v02 HPE   )
[    0.000000][    T0] ACPI: XSDT 0x00000000F9720028 0000DC (v01 HPE    ServerCL 01072009 AMI  00010013)
[    0.000000][    T0] ACPI: FACP 0x00000000F9720108 000114 (v06 HPE    ServerCL 01072009 AMI  00010013)
[    0.000000][    T0] ACPI: DSDT 0x00000000F9720220 000714 (v02 HPE    ServerCL 20150406 INTL 20170831)
[    0.000000][    T0] ACPI: FIDT 0x00000000F9720938 00009C (v01 HPE    ServerCL 01072009 AMI  00010013)
...

# lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              224
On-line CPU(s) list: 0-223
Thread(s) per core:  4
Core(s) per socket:  28
Socket(s):           2
NUMA node(s):        2
Vendor ID:           Cavium
Model:               1
Model name:          ThunderX2 99xx
Stepping:            0x1
BogoMIPS:            400.00
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            32768K
NUMA node0 CPU(s):   0-111
NUMA node1 CPU(s):   112-223
Flags:               fp asimd aes pmull sha1 sha2 crc32 atomics cpuid asimdrdm

> ---
>  arch/arm64/include/asm/cpu.h |  2 ++
>  arch/arm64/kernel/head.S     |  3 +++
>  arch/arm64/kernel/setup.c    | 12 ++++++------
>  arch/arm64/kernel/smp.c      | 13 ++++++++-----
>  4 files changed, 19 insertions(+), 11 deletions(-)
> 
> Since v1[1]:
> 
> * Fix typos
> * Rebase atop v5.9-rc4
> 
> Mark.
> 
> [1] https://lore.kernel.org/r/20200730163806.23053-1-mark.rutland@arm.com
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 7faae6ff3ab4d..d9d60b18e8116 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -68,4 +68,6 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info);
>  void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
>  				 struct cpuinfo_arm64 *boot);
>  
> +void init_this_cpu_offset(void);
> +
>  #endif /* __ASM_CPU_H */
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 037421c66b147..2720e6ec68140 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -452,6 +452,8 @@ SYM_FUNC_START_LOCAL(__primary_switched)
>  	bl	__pi_memset
>  	dsb	ishst				// Make zero page visible to
> PTW
>  
> +	bl	init_this_cpu_offset
> +
>  #ifdef CONFIG_KASAN
>  	bl	kasan_early_init
>  #endif
> @@ -758,6 +760,7 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>  	ptrauth_keys_init_cpu x2, x3, x4, x5
>  #endif
>  
> +	bl	init_this_cpu_offset
>  	b	secondary_start_kernel
>  SYM_FUNC_END(__secondary_switched)
>  
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 53acbeca4f574..fde4396418add 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -87,12 +87,6 @@ void __init smp_setup_processor_id(void)
>  	u64 mpidr = read_cpuid_mpidr() & MPIDR_HWID_BITMASK;
>  	set_cpu_logical_map(0, mpidr);
>  
> -	/*
> -	 * clear __my_cpu_offset on boot CPU to avoid hang caused by
> -	 * using percpu variable early, for example, lockdep will
> -	 * access percpu variable inside lock_release
> -	 */
> -	set_my_cpu_offset(0);
>  	pr_info("Booting Linux on physical CPU 0x%010lx [0x%08x]\n",
>  		(unsigned long)mpidr, read_cpuid_id());
>  }
> @@ -281,6 +275,12 @@ u64 cpu_logical_map(int cpu)
>  	return __cpu_logical_map[cpu];
>  }
>  
> +void noinstr init_this_cpu_offset(void)
> +{
> +	unsigned int cpu = task_cpu(current);
> +	set_my_cpu_offset(per_cpu_offset(cpu));
> +}
> +
>  void __init __no_sanitize_address setup_arch(char **cmdline_p)
>  {
>  	init_mm.start_code = (unsigned long) _text;
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 355ee9eed4dde..7714310fba226 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -192,10 +192,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	u64 mpidr = read_cpuid_mpidr() & MPIDR_HWID_BITMASK;
>  	struct mm_struct *mm = &init_mm;
>  	const struct cpu_operations *ops;
> -	unsigned int cpu;
> -
> -	cpu = task_cpu(current);
> -	set_my_cpu_offset(per_cpu_offset(cpu));
> +	unsigned int cpu = smp_processor_id();
>  
>  	/*
>  	 * All kernel threads share the same mm context; grab a
> @@ -435,7 +432,13 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  
>  void __init smp_prepare_boot_cpu(void)
>  {
> -	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
> +	/*
> +	 * Now that setup_per_cpu_areas() has allocated the runtime per-cpu
> +	 * areas it is only safe to read the CPU0 boot-time area, and we must
> +	 * reinitialize the offset to point to the runtime area.
> +	 */
> +	init_this_cpu_offset();
> +
>  	cpuinfo_store_boot_cpu();
>  
>  	/*

