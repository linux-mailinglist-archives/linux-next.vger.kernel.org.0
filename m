Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B923C28DA5B
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 09:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgJNHPy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 03:15:54 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:40358 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgJNHPy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 03:15:54 -0400
Received: by mail-ej1-f67.google.com with SMTP id p15so3309842ejm.7;
        Wed, 14 Oct 2020 00:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4MB/WEv7WVbXZ32vpSI6tjTzebAt77Hp+rVbyGH87qE=;
        b=dvDSGQ0rBl3xy0xVJA73IF0AvHun8UjcSHxYrCJwvysNenGwvvlO5DxOOvmi3A+IwP
         PUmUcm2AJuLf44TItHxHeaU77UAmeh/GkPwcvtGy/wSKxnyl+l9M6Gvul2Q0bsOpmE4o
         xxeKDz3qFgu2ix4ojbAnWj4RRY1ErTpViIAkLL3lwMXFDas7XuKp+5VB40qT355PTahe
         8D1ycfQ30wLNGZl8QVDHst3prXKB2EpZkMvynRa8A6KjOMjlOQXr+uguJLY5OCUIPMXW
         jTZCH+hvG/sc1T8/iZU5tO+FRVpvzpLDh3NuMZu8YiffEk+wkcBggYPGnLSgjFSaqWL9
         MXew==
X-Gm-Message-State: AOAM5330Z1O51wRKJJihDPc/+7gQTT/CQ87cMjO+cwSjrsct5PX0N7uy
        tMcbr2ZLDvnBs5Dy0Z6TsX0=
X-Google-Smtp-Source: ABdhPJxuCAYjKRp/eva7cZT3owH1+7r57Z5oPnyVCvomekbZaEZKPotTUv597H2IZrn48haP5D4yzg==
X-Received: by 2002:a17:906:f151:: with SMTP id gw17mr3759548ejb.119.1602659751468;
        Wed, 14 Oct 2020 00:15:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.240])
        by smtp.googlemail.com with ESMTPSA id me12sm1104240ejb.108.2020.10.14.00.15.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Oct 2020 00:15:50 -0700 (PDT)
Date:   Wed, 14 Oct 2020 09:15:47 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Sven Schnelle <svens@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
        Kees Cook <keescook@chromium.org>
Subject: Re: autofs crash with latest linux-next
Message-ID: <20201014071547.GA2459@kozik-lap>
References: <yt9d1ri3nakg.fsf@linux.ibm.com>
 <8a4c7324-4637-7f25-82b6-2fd30aacb73e@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a4c7324-4637-7f25-82b6-2fd30aacb73e@de.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 09:20:12AM +0200, Christian Borntraeger wrote:
> CC linux-next, Al Viro.
> 
> On 12.10.20 09:54, Sven Schnelle wrote:
> > Hi,
> > 
> > on s390 i see the following crash with linux-next:
> > 
> > [ 4525.432605] Unable to handle kernel pointer dereference in virtual kernel address space
> > [ 4525.432612] Failing address: 0000000000000000 TEID: 0000000000000483
> > [ 4525.432613] Fault in home space mode while using kernel ASCE.
> > [ 4525.432616] AS:00000000cf048007 R3:00000001fffec007 S:00000001ffff1800 P:000000000000003d 
> > [ 4525.432640] Oops: 0004 ilc:3 [#1] SMP 
> > [ 4525.432644] Modules linked in: dm_crypt encrypted_keys lcs ctcm fsm nfsv3 nfs_acl nfs lockd grace quota_v2 quota_tree tun overlay ntfs exfat vfat fat sctp vfio_pci irqbypass vfio_virqfd scsi_debug vhost_vsock vmw_vsock_virtio_transport_common vsock vhost vhost_iotlb vfio_ap kvm loop nft_counter bridge stp llc dm_service_time nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink sunrpc dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua s390_trng vfio_ccw vfio_mdev mdev vfio_iommu_type1 vfio zcrypt_cex4 eadm_sch sch_fq_codel ip_tables x_tables ghash_s390 prng aes_s390 des_s390 libdes sha3_512_s390 sha3_256_s390 sha512_s390 sha256_s390 sha1_s390 sha_common pkey zcrypt rng_core autofs4 [last unloaded: dummy_del_mod]
> > [ 4525.432691] CPU: 9 PID: 1050921 Comm: find Tainted: G           OE     5.9.0-20201011.rc8.git0.d67bc7812221.300.fc32.s390x+next #1
> > [ 4525.432693] Hardware name: IBM 3906 M04 704 (LPAR)
> > [ 4525.432694] Krnl PSW : 0704d00180000000 00000000cde29f70 (__kernel_write+0x1a0/0x2a0)
> > [ 4525.432702]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:1 PM:0 RI:0 EA:3
> > [ 4525.432704] Krnl GPRS: 0000000100067343 0000000000000000 0000000000000130 0000000000000001
> > [ 4525.432705]            0000000000000006 000000005f82be2f 0000000000000130 000000008c6ab568
> > [ 4525.432728]            0000000084441f00 0000000000000000 0000000000000130 0000000084441f00
> > [ 4525.432729]            0000000081476000 0000000000000001 00000000cde29ef4 000003e002f5b6f0
> > [ 4525.432735] Krnl Code: 00000000cde29f62: a7280000		lhi	%r2,0
> >                           00000000cde29f66: a7f4ff9d		brc	15,00000000cde29ea0
> >                          #00000000cde29f6a: e310f0f00004	lg	%r1,240(%r15)
> >                          >00000000cde29f70: e31090000024	stg	%r1,0(%r9)
> >                           00000000cde29f76: 9104b044		tm	68(%r11),4
> >                           00000000cde29f7a: a784000f		brc	8,00000000cde29f98
> >                           00000000cde29f7e: e31003400004	lg	%r1,832
> >                           00000000cde29f84: b904002a		lgr	%r2,%r10
> > [ 4525.432748] Call Trace:
> > [ 4525.432750]  [<00000000cde29f70>] __kernel_write+0x1a0/0x2a0 
> > [ 4525.432752] ([<00000000cde29ef4>] __kernel_write+0x124/0x2a0)
> > [ 4525.432756]  [<000003ff80004cfa>] autofs_write+0x5a/0x140 [autofs4] 
> > [ 4525.432758]  [<000003ff80005262>] autofs_notify_daemon.constprop.0+0x10a/0x1c8 [autofs4] 
> > [ 4525.432760]  [<000003ff80005872>] autofs_wait+0x552/0x718 [autofs4] 
> > [ 4525.432762]  [<000003ff800033ca>] autofs_mount_wait+0x5a/0xb0 [autofs4] 
> > [ 4525.432764]  [<000003ff800048b2>] autofs_d_automount+0x102/0x278 [autofs4] 
> > [ 4525.432766]  [<00000000cde398fe>] __traverse_mounts+0x9e/0x270 
> > [ 4525.432768]  [<00000000cde3e7ee>] step_into+0x1de/0x280 
> > [ 4525.432770]  [<00000000cde3f000>] open_last_lookups+0xb8/0x3f8 
> > [ 4525.432772]  [<00000000cde3f726>] path_openat+0x86/0x1d0 
> > [ 4525.432773]  [<00000000cde425b0>] do_filp_open+0x78/0x118 
> > [ 4525.432776]  [<00000000cde278d0>] do_sys_openat2+0xa8/0x168 
> > [ 4525.432778]  [<00000000cde27cfa>] __s390x_sys_openat+0x6a/0x98 
> > [ 4525.432781]  [<00000000ce64f2e8>] system_call+0xdc/0x2a4 
> > [ 4525.432782] Last Breaking-Event-Address:
> > [ 4525.432783]  [<00000000cde29efc>] __kernel_write+0x12c/0x2a0
> > 
> > This seems to be caused by the result of merging 0fb702791bf ("autofs:
> > use __kernel_write() for the autofs pipe writing") and 4d03e3cc5982
> 
> I cannot find the first commit ids. To me it looks like this should be 
> 
> commit 90fb702791bf99b959006972e8ee7bb4609f441b
> Author:     Linus Torvalds <torvalds@linux-foundation.org>
> AuthorDate: Tue Sep 29 17:18:34 2020 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Tue Sep 29 17:18:34 2020 -0700
> 
>     autofs: use __kernel_write() for the autofs pipe writing
> 
> instead?
> 
> 
> > ("fs: don't allow kernel reads and writes without iter
> > ops"). __kernel_write() gets now called with a NULL pointer as pos
> > argument, but __kernel_write expects a valid pointer as it
> > fetches/stores the pos value there. Is there a fix pending somewhere?

Hi All,

+CC Kees Cook (reviewer),

I hit this since few days as well. Although the bisect points to the
merge, the issue looks like a result of mentioned commit 4d03e3cc5982
("fs: don't allow kernel reads and writes without iter ops").

The __kernel_read() last argument 'pos' can be NULL and it is
dereferenced here (added by the commit):

 525 ssize_t __kernel_write(struct file *file, const void *buf, size_t count, loff_t *pos)
...
 547         kiocb.ki_pos = *pos;
 548         iov_iter_kvec(&iter, WRITE, &iov, 1, iov.iov_len);


The __kernel_read() is called with NULL in fs/autofs/waitq.c:

 45 static int autofs_write(struct autofs_sb_info *sbi,
 46                         struct file *file, const void *addr, int bytes)

...
 54         mutex_lock(&sbi->pipe_mutex);
 55         while (bytes) {
 56                 wr = __kernel_write(file, data, bytes, NULL);

Best regards,
Krzysztof

