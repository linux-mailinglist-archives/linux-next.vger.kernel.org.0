Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E5731062A
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 09:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhBEICu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 03:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhBEICt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 03:02:49 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348A3C061786;
        Fri,  5 Feb 2021 00:02:09 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DX7DY27djz9sWl;
        Fri,  5 Feb 2021 19:02:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612512125;
        bh=b5o08encDDbBpkEHesUtiuTB1D8tQcH/C5EQnOhllIg=;
        h=Date:From:To:Cc:Subject:From;
        b=Sukv7t27w50fmoqipoVm3szKxHWXLN6osIPBBQSBOI3sC3kcddVAktGowlqNC4hkJ
         3qYW+hRb1rY3zfX3aZZZX/m8KV/qO/APGbtglVV6g1t44e7Wq+oIFOFW/A1JBseJon
         IULksZS9Gj+h0DDyDCal2i7WigYPi6e3JtfmbJv8XPw46UM8ooGJw4RFGjMOkqlQ7d
         8ubqu0sW/yxzRED2QSXErsHurmCgXH228Y4dPx8kDbHDMHfjf4FsP7p5qGUVJtbmsi
         g3kHFB7yYi9xbve9dThLmJ9YT6TcNsuQFcTTv2IqKexjzPXQjwNVOn86czZqFBKvYh
         DOAzmIFt6Xykg==
Date:   Fri, 5 Feb 2021 19:02:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>
Cc:     Dexuan Cui <decui@microsoft.com>,
        Lillian Grassin-Drake <ligrassi@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: linux-next: manual merge of the hyperv tree with Linus' tree
Message-ID: <20210205190202.29c2b74e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//QenhhjKn_7h_v3V1YKu7Jo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//QenhhjKn_7h_v3V1YKu7Jo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  arch/x86/hyperv/hv_init.c

between commit:

  fff7b5e6ee63 ("x86/hyperv: Initialize clockevents after LAPIC is initiali=
zed")

from Linus' tree and commits:

  a06c2e7df586 ("x86/hyperv: extract partition ID from Microsoft Hypervisor=
 if necessary")
  fa2c411b58fe ("x86/hyperv: implement an MSI domain for root partition")

from the hyperv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/hyperv/hv_init.c
index 6375967a8244,5ad48e8033e3..000000000000
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@@ -26,9 -26,11 +27,13 @@@
  #include <linux/cpuhotplug.h>
  #include <linux/syscore_ops.h>
  #include <clocksource/hyperv_timer.h>
+ #include <linux/highmem.h>
+=20
+ u64 hv_current_partition_id =3D ~0ull;
+ EXPORT_SYMBOL_GPL(hv_current_partition_id);
 =20
 +int hyperv_init_cpuhp;
 +
  void *hv_hypercall_pg;
  EXPORT_SYMBOL_GPL(hv_hypercall_pg);
 =20
@@@ -315,25 -339,24 +342,43 @@@ static struct syscore_ops hv_syscore_op
  	.resume		=3D hv_resume,
  };
 =20
 +static void (* __initdata old_setup_percpu_clockev)(void);
 +
 +static void __init hv_stimer_setup_percpu_clockev(void)
 +{
 +	/*
 +	 * Ignore any errors in setting up stimer clockevents
 +	 * as we can run with the LAPIC timer as a fallback.
 +	 */
 +	(void)hv_stimer_alloc();
 +
 +	/*
 +	 * Still register the LAPIC timer, because the direct-mode STIMER is
 +	 * not supported by old versions of Hyper-V. This also allows users
 +	 * to switch to LAPIC timer via /sys, if they want to.
 +	 */
 +	if (old_setup_percpu_clockev)
 +		old_setup_percpu_clockev();
 +}
 +
+ static void __init hv_get_partition_id(void)
+ {
+ 	struct hv_get_partition_id *output_page;
+ 	u64 status;
+ 	unsigned long flags;
+=20
+ 	local_irq_save(flags);
+ 	output_page =3D *this_cpu_ptr(hyperv_pcpu_output_arg);
+ 	status =3D hv_do_hypercall(HVCALL_GET_PARTITION_ID, NULL, output_page);
+ 	if ((status & HV_HYPERCALL_RESULT_MASK) !=3D HV_STATUS_SUCCESS) {
+ 		/* No point in proceeding if this failed */
+ 		pr_err("Failed to get partition ID: %lld\n", status);
+ 		BUG();
+ 	}
+ 	hv_current_partition_id =3D output_page->partition_id;
+ 	local_irq_restore(flags);
+ }
+=20
  /*
   * This function is to be invoked early in the boot sequence after the
   * hypervisor has been detected.
@@@ -408,18 -437,41 +459,45 @@@ void __init hyperv_init(void
 =20
  	rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
  	hypercall_msr.enable =3D 1;
- 	hypercall_msr.guest_physical_address =3D vmalloc_to_pfn(hv_hypercall_pg);
- 	wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
+=20
+ 	if (hv_root_partition) {
+ 		struct page *pg;
+ 		void *src, *dst;
+=20
+ 		/*
+ 		 * For the root partition, the hypervisor will set up its
+ 		 * hypercall page. The hypervisor guarantees it will not show
+ 		 * up in the root's address space. The root can't change the
+ 		 * location of the hypercall page.
+ 		 *
+ 		 * Order is important here. We must enable the hypercall page
+ 		 * so it is populated with code, then copy the code to an
+ 		 * executable page.
+ 		 */
+ 		wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
+=20
+ 		pg =3D vmalloc_to_page(hv_hypercall_pg);
+ 		dst =3D kmap(pg);
+ 		src =3D memremap(hypercall_msr.guest_physical_address << PAGE_SHIFT, PA=
GE_SIZE,
+ 				MEMREMAP_WB);
+ 		BUG_ON(!(src && dst));
+ 		memcpy(dst, src, HV_HYP_PAGE_SIZE);
+ 		memunmap(src);
+ 		kunmap(pg);
+ 	} else {
+ 		hypercall_msr.guest_physical_address =3D vmalloc_to_pfn(hv_hypercall_pg=
);
+ 		wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
+ 	}
 =20
  	/*
 -	 * Ignore any errors in setting up stimer clockevents
 -	 * as we can run with the LAPIC timer as a fallback.
 +	 * hyperv_init() is called before LAPIC is initialized: see
 +	 * apic_intr_mode_init() -> x86_platform.apic_post_init() and
 +	 * apic_bsp_setup() -> setup_local_APIC(). The direct-mode STIMER
 +	 * depends on LAPIC, so hv_stimer_alloc() should be called from
 +	 * x86_init.timers.setup_percpu_clockev.
  	 */
 -	(void)hv_stimer_alloc();
 +	old_setup_percpu_clockev =3D x86_init.timers.setup_percpu_clockev;
 +	x86_init.timers.setup_percpu_clockev =3D hv_stimer_setup_percpu_clockev;
 =20
  	hv_apic_init();
 =20
@@@ -427,7 -479,20 +505,22 @@@
 =20
  	register_syscore_ops(&hv_syscore_ops);
 =20
 +	hyperv_init_cpuhp =3D cpuhp;
++
+ 	if (cpuid_ebx(HYPERV_CPUID_FEATURES) & HV_ACCESS_PARTITION_ID)
+ 		hv_get_partition_id();
+=20
+ 	BUG_ON(hv_root_partition && hv_current_partition_id =3D=3D ~0ull);
+=20
+ #ifdef CONFIG_PCI_MSI
+ 	/*
+ 	 * If we're running as root, we want to create our own PCI MSI domain.
+ 	 * We can't set this in hv_pci_init because that would be too late.
+ 	 */
+ 	if (hv_root_partition)
+ 		x86_init.irqs.create_pci_msi_domain =3D hv_create_pci_msi_domain;
+ #endif
+=20
  	return;
 =20
  remove_cpuhp_state:

--Sig_//QenhhjKn_7h_v3V1YKu7Jo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAc+3oACgkQAVBC80lX
0GyvOgf+KKnzkfdO0KLIEhChM+ISB46wJRi3FmMbzGQd+XEQSXBieQRxD0rnOAsU
zLFeUS66MX/qO8mOShgIYsLN8XlQZYn0NI0Gnr58AZWwaEywhV6ljyDp7zb+S2rR
2+EyHJlXiq7Z2JD2PLvdMLj3g5DEpO/Nv2pTY76Q6d7P44X9ABOeyJA0LzZOz3mz
vQ7jb8olVF2z9u26Z6rDnJ+R0d8zhK7SdsrerEHOSNpwHC7J8Tp4MNablitRp1Ee
gv2bTHl7GEDzAhg/lK/NjHaFbWMIyDK/DMNtxrO83b/cM7MjwYlhyVLovkXPsC+G
DY7wem+PqwBXR+5xIBhVFcTIxGPBhQ==
=sinR
-----END PGP SIGNATURE-----

--Sig_//QenhhjKn_7h_v3V1YKu7Jo--
