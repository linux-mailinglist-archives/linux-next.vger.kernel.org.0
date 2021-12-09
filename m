Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BC846E534
	for <lists+linux-next@lfdr.de>; Thu,  9 Dec 2021 10:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhLIJN5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Dec 2021 04:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbhLIJN5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Dec 2021 04:13:57 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93B5C0617A1;
        Thu,  9 Dec 2021 01:10:23 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r11so16989141edd.9;
        Thu, 09 Dec 2021 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sJoVU9klWO6bGEjKM02dAicj//trH30/35FzBybYe1s=;
        b=SAEM0o/SvsVfAEMo5IdqWAOFq3L9C9JbTTLaZCyGYhNVxGb2dGeIfi6I7hNSHeu+YO
         7cAaDWHnDdlPiqO7HgbLmBWyfHcSGNV85x8dzIS4NvO90i9E2+eTAKAWraSV8vxdHfS9
         uxZBqY7mcqUia8fzGRfwZy8oVUr9YbG5Rs8grkzesxIJ04tu5Eh1DmMmdnGnCvFG2kOP
         HGU6jXacg8jd50PdBnYxtmYWKDrwHC97Vh8iQnIHzTk1gVZTS2yNEZ5r20DPMiyr/h39
         JBEQenh+UWE+7GyQJqZ9RuJl1B/NwvLapxg8i5eDZxx9hL+mwi37psq/39xXfKJijxs5
         +VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sJoVU9klWO6bGEjKM02dAicj//trH30/35FzBybYe1s=;
        b=3Ihn9ArpQq/q32boL8Yg/YyyrOAQ2YsL517et4TcsQyaLtc4iwbYpf6hd7+jsG+RJ1
         7VKBf1BkowSUJYTNWdrUkdM3JVsvZauhJKDoac0QWpWWfr59y0uJ6emLGKCtn6wHozhE
         gktiAlrlnvOaijVtH+1FCnPl4yskQEnoWwgaoyN952Js5al3GK9XrMxvVfOrL8yL2dl2
         tkxec6yuG3w4y9NaA/qPmAjceDg/n3xG4OEAHeqhjXzGefDMAOvploz3b34arubcTra4
         rLEHy8iIYxivNV0aT13f4zxN8s/r4scW6cU9tt5PQvO/i89JrnyPrP/Nga//S2hgD80y
         6l8A==
X-Gm-Message-State: AOAM533iRbf2/pnyjCyEI/X1BTWitmaflVraB36H8BEEHVZ+vivlC0yk
        o6ak11P27Ym/umDSmyhBWVthasBAmHCrdF9h0/k=
X-Google-Smtp-Source: ABdhPJweVVwN3tfZjLXfOG5F0pQQO1+MEpKT8tYOtFJ6M5BhKVJXBd2mFSsOY38MLARoTVcK62qQ0Mlup4jWGI2YUa8=
X-Received: by 2002:a50:da48:: with SMTP id a8mr27022385edk.146.1639041022237;
 Thu, 09 Dec 2021 01:10:22 -0800 (PST)
MIME-Version: 1.0
References: <CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
In-Reply-To: <CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
From:   Shyam Prasad N <nspmangalore@gmail.com>
Date:   Thu, 9 Dec 2021 14:40:11 +0530
Message-ID: <CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
Subject: Re: [ linux-next ] 20211206 tree cifs panic
To:     Murphy Zhou <jencce.kernel@gmail.com>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Murphy,

Can you please share the kernel config file used for this test?
Is cachefilesd configured on this test setup?

Regards,
Shyam

On Wed, Dec 8, 2021 at 2:57 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
>
> Hi,
>
> A connectathon test triggers panic like below. The server is a  smb
> share on the same server with the test client.
>
>
> [  594.061343] Key type cifs.spnego registered
> [  594.082337] Key type cifs.idmap registered
> [  594.104961] CIFS: No dialect specified on mount. Default has
> changed to a more secure dialect, SMB2.1 or later (e.g. SMB3.1.1),
> from CIFS (SMB1). To use the less secure SMB1 dialect to access old
> servers which do not support SMB3.1.1 (or even SMB3 or SMB2.1) specify
> vers=1.0 on mount.
> [  594.223460] CIFS: Attempting to mount \\hp-dl380pg8\testuser
> [  594.287771] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [  594.319712] #PF: supervisor write access in kernel mode
> [  594.343627] #PF: error_code(0x0002) - not-present page
> [  594.366791] PGD 0 P4D 0
> [  594.378172] Oops: 0002 [#1] PREEMPT SMP PTI
> [  594.397047] CPU: 0 PID: 52196 Comm: mount.cifs Kdump: loaded
> Tainted: G          I       5.16.0-rc4-next-20211206 #1
> [  594.445144] Hardware name: HP ProLiant DL380p Gen8, BIOS P70 08/02/2014
> [  594.475201] RIP: 0010:cifs_fscache_get_inode_cookie+0x2f/0xb0 [cifs]
> [  594.503934] Code: 53 48 89 fb 48 83 ec 20 65 48 8b 04 25 28 00 00
> 00 48 89 44 24 18 48 8b 47 28 48 8b b8 88 03 00 00 e8 35 c6 fa ff 48
> 8b 53 68 <48> 89 14 25 00 00 00 00 48 8b 53 70 89 14 25 10 00 00 00 48
> 8b 53
> [  594.590004] RSP: 0018:ffffb93c4998fc10 EFLAGS: 00010282
> [  594.614861] RAX: ffff970743ab5000 RBX: ffff970411193168 RCX: 0000000000000000
> [  594.650920] RDX: 0000000061b01059 RSI: 00000000000041ed RDI: ffff970453924780
> [  594.686189] RBP: ffffb93c4998fce8 R08: ffff970411193168 R09: ffff970743ab1548
> [  594.718776] R10: 000000009f8bdc24 R11: 000000009053e561 R12: 000000000e1c25d9
> [  594.750925] R13: ffff970411193168 R14: ffff970743ab1000 R15: ffff970743ab5000
> [  594.783532] FS:  00007f2037080780(0000) GS:ffff97072f600000(0000)
> knlGS:0000000000000000
> [  594.820129] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  594.846183] CR2: 0000000000000000 CR3: 0000000141820006 CR4: 00000000001706f0
> [  594.878376] Call Trace:
> [  594.889469]  <TASK>
> [  594.898870]  cifs_iget+0x14b/0x160 [cifs]
> [  594.917781]  cifs_get_inode_info+0x430/0x750 [cifs]
> [  594.941267]  ? __d_instantiate+0x34/0xf0
> [  594.960012]  ? _raw_spin_unlock+0x16/0x30
> [  594.978111]  ? d_instantiate+0x3e/0x60
> [  594.994982]  cifs_root_iget+0x33b/0x4b0 [cifs]
> [  595.015099]  cifs_read_super+0x125/0x200 [cifs]
> [  595.035596]  cifs_smb3_do_mount+0x224/0x330 [cifs]
> [  595.057009]  smb3_get_tree+0x2d/0x50 [cifs]
> [  595.076065]  vfs_get_tree+0x25/0xb0
> [  595.092562]  do_new_mount+0x176/0x310
> [  595.110929]  __x64_sys_mount+0x103/0x140
> [  595.130439]  do_syscall_64+0x3b/0x90
> [  595.147929]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  595.172646] RIP: 0033:0x7f2037195c4e
> [  595.188703] Code: 48 8b 0d dd 71 0e 00 f7 d8 64 89 01 48 83 c8 ff
> c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d aa 71 0e 00 f7 d8 64 89
> 01 48
> [  595.273644] RSP: 002b:00007fff27645a38 EFLAGS: 00000202 ORIG_RAX:
> 00000000000000a5
> [  595.307790] RAX: ffffffffffffffda RBX: 000055690a1bb910 RCX: 00007f2037195c4e
> [  595.340187] RDX: 0000556908d5946b RSI: 0000556908d594b6 RDI: 00007fff27647fbe
> [  595.372419] RBP: 000055690a1bb8f0 R08: 000055690a1bb910 R09: 0000000000000077
> [  595.404633] R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff27647fb3
> [  595.436882] R13: 00007f203729d000 R14: 00007f203729f70e R15: 00007fff27647fbe
> [  595.468980]  </TASK>
> [  595.478769] Modules linked in: cifs cifs_arc4 cifs_md4 loop nfsv3
> rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache netfs rpcrdma rdma_cm
> iw_cm ib_cm ib_core nfsd auth_rpcgss nfs_acl lockd grace rfkill sunrpc
> intel_rapl_msr intel_rapl_common sb_edac x86_pkg_temp_thermal
> intel_powerclamp mgag200 coretemp i2c_algo_bit kvm_intel
> drm_shmem_helper drm_kms_helper ipmi_ssif iTCO_wdt kvm
> iTCO_vendor_support acpi_ipmi syscopyarea irqbypass sysfillrect
> ipmi_si rapl intel_cstate ioatdma ipmi_devintf sysimgblt intel_uncore
> fb_sys_fops cec lpc_ich ipmi_msghandler acpi_power_meter pcspkr dca
> hpilo drm fuse xfs libcrc32c sr_mod cdrom sd_mod ata_generic t10_pi sg
> ata_piix crct10dif_pclmul crc32_pclmul crc32c_intel libata serio_raw
> tg3 ghash_clmulni_intel hpsa hpwdt scsi_transport_sas dm_mirror
> dm_region_hash dm_log dm_mod
> [  595.821049] CR2: 0000000000000000



-- 
Regards,
Shyam
