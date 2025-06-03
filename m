Return-Path: <linux-next+bounces-7034-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31489ACCCE3
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 20:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 348177A4073
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 18:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D344288C82;
	Tue,  3 Jun 2025 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1ASCjvp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097F288C20
	for <linux-next@vger.kernel.org>; Tue,  3 Jun 2025 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975187; cv=none; b=T2YtCnOELPG70GeDssdjLQIE0jX6Jko4Jk4mXRgCExRG71itYNoYMd6oAUKEUiCWVlyMjmLRgq65dP4tYXBO7sp65UnPmgvAM+M2xqskqPcTzLokzTtWgsawzqrlCRohoRCQEFCs2eXlKNVQ/IY6JOvk0d1pUOHwtq+7zwpPck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975187; c=relaxed/simple;
	bh=aP7wQCItpeoanZjQ7OkJFpmOdfAhwGFT8z8omequOh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVQ8zpMcviL7S7ZYbTvpnuErTxqixsN+B+IfaxcmVKZqZ9x3w7P9OzxGJ2R9SpyX/QN96bkYBD7sqI8I00UBg6lwihdIzfvtAa9MPnMMSojueC7PA6AWrHUfKRdw+A9zuSKpB4Lb88aPIv4a7RIQMLTOjwXKd55lNfhKeuwgKiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1ASCjvp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235d6de331fso7748375ad.3
        for <linux-next@vger.kernel.org>; Tue, 03 Jun 2025 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748975185; x=1749579985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+jLcw8kRvCORysKGJ561cwXsPeKDELbKGC8xT8H9uU=;
        b=H1ASCjvpjuBzn4OLue2fwaiuvJOWD3/jrzD60MHLaNAlbLOQ/KGZKqZms89a8ltCXv
         Z51X+oWQbfPS3WDKCNDFlyLNL2QI7vSWE1c1/sO9GMv7rDPOtR7q3cKaijqdRpIFVsEq
         miKnlnYGg2hdO0kEzKuIdIArIPFm97Bp9r7J1pqm9ii8Mxqu3+47+6MaIYG47s3H9kH2
         3UJb3Mj978q0nr4pYAMC88WFMOsdadlbtxJV2kXwjlQMQ4aaDLUeJwpBkIGzzyws0DF0
         j/yP4SjtOXr7Y2B8fgw5yYvi45jXacj4tcu0qA3oKzlGmEqrjTHAgD3w3YDuSx0b0eyD
         CPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748975185; x=1749579985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+jLcw8kRvCORysKGJ561cwXsPeKDELbKGC8xT8H9uU=;
        b=V64gDfk8uDbEbAAHWZhU/ONGL7/32Incl3t8GNCAXWkg5her0s+iMbh2UYV4lALBq+
         ODp1Rg3YWWhn1WBN04cofEjVREDCAPU0gJuuotDOWblf++uStS6/2O4PHwy5uFnbdZJD
         NjVEfCT7xck2O4GHS1HLwBhheinZip/NEQGUxujGJ9Q6jsu9Zbv+JumBLiggjoSwAhdn
         L/2MB96RAasYMmxgnjZasSx7lioMnkWbfa1Oc7r+YlwPmaxzboPA+9TvNw+JQzP2cOVr
         VVL28uEPVGb0Q8RpByMZ4J2vq9a2fygkWFmnRWHeQGH3f3iwfbcpq+ua915cD2j/5fqU
         bx2w==
X-Forwarded-Encrypted: i=1; AJvYcCVf4qNfRpdYPglrYs8nz0hse2IpqXkendA8fDF2OLZQc8fummQtbzD38AHtQzfR38sRtPHnvluS+jhk@vger.kernel.org
X-Gm-Message-State: AOJu0YzdUwCaXfRXY2DY+zy7UAk+WheZ9WHi/5RHPqo2Iprmi1u2ikUj
	So/jNiWNeYJeUqBN/vOqciQFgyOFd2P3aDPk+ltXfaaWh64kNheNNS9s
X-Gm-Gg: ASbGncvxxakGRkpim2Rn+7ZVT5Py4G2yOOzgQubgSPijlraRiBBUSpXg3+G7XgsA4oF
	pjR6zOnqBvWFrT5ZkuDPUVqLfcC0Hlb4xH0ClqnZuDikEeYAhEJuBkY4VHGcXSx/tGTfFUYH9k8
	bW7d5KzYgHjo8cJzXCKL5NeHIajAnVZj8W2wUKzyRdGd/H6US9GSPmfzFxtcNLD73PPjY9TrfDj
	BxvHiE9LTnQZ/fEO69s2GhbyYzqcMq0+SnvUAdCDn+uB6Zto/0AvUCwB2kyUvxLICH+oChWDN/q
	g8MFST5BZt5xJoVSzW5zsfH4qEqhMq21WEYfDR1e67SzegbdiyKNgalgZ1E5AihoBHx4cudY0i+
	0o/wRuIdfiztGuHzzlMlXVxk9SODJkmmf
X-Google-Smtp-Source: AGHT+IHEs/I/rKMDknyujNbipgP8bFtG/QwCqNcI86c8rOFJ6c/SjDXX1NO9MERG2EVUx5gMRCn6gA==
X-Received: by 2002:a17:902:f711:b0:235:f70:fd39 with SMTP id d9443c01a7336-23538ed055dmr280361185ad.10.1748975185286;
        Tue, 03 Jun 2025 11:26:25 -0700 (PDT)
Received: from [192.168.2.117] (c-67-188-127-15.hsd1.ca.comcast.net. [67.188.127.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd8e2dsm90515165ad.56.2025.06.03.11.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 11:26:24 -0700 (PDT)
Message-ID: <adf2842b-a5a4-4a7c-86b7-8bcfbf2b7b01@gmail.com>
Date: Tue, 3 Jun 2025 11:26:23 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000020
To: paulmck@kernel.org
Cc: klarasmodin@gmail.com, tj@kernel.org, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org
References: <04ca279b-8c96-4072-9b19-0001e7da5124@paulmck-laptop>
Content-Language: en-US
From: JP Kobryn <inwardvessel@gmail.com>
In-Reply-To: <04ca279b-8c96-4072-9b19-0001e7da5124@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,
On 6/3/25 8:02 AM, Paul E. McKenney wrote:
> Hello!
> 
> Running rcutorture scenario SRCU-T on next-20250602 gets me the following
> splat, with CONFIG_SMP=y and CONFIG_PROVE_LOCKING=y appearing to be what
> exposes this issue (alleged fix at end of this email):
> 
> [    0.584099] BUG: kernel NULL pointer dereference, address: 0000000000000020
> [    0.584530] #PF: supervisor write access in kernel mode
> [    0.584530] #PF: error_code(0x0002) - not-present page
> [    0.584530] PGD 0 P4D 0
> [    0.584530] Oops: Oops: 0002 [#1] PTI
> [    0.584530] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-next-20250530 #5184 NONE
> [    0.584530] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [    0.584530] RIP: 0010:lockdep_init_map_type+0x1c/0x230
> [    0.584530] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 41 55 41 89 cd 41 54 49 89 d4 8b 15 fc 59 f1 02 55 48 89 fd 8b 44 24 20 <48> c7 47 08 00 00 00 00 48 c7 47 10 00 00 00 00 85 d2 0f 84 a2 00
> [    0.584530] RSP: 0000:ffffffff83a03e30 EFLAGS: 00010246
> [    0.584530] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [    0.584530] RDX: 0000000000000000 RSI: ffffffff837ff493 RDI: 0000000000000018
> [    0.584530] RBP: 0000000000000018 R08: 0000000000000002 R09: 0000000000000000
> [    0.584530] R10: 0000000000000001 R11: 0000000000001f20 R12: ffffffff850436e0
> [    0.584530] R13: 0000000000000000 R14: ffffffff83b66da8 R15: ffffffff83c00ec0
> [    0.584530] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.584530] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.584530] CR2: 0000000000000020 CR3: 0000000012a50000 CR4: 00000000000006f0
> [    0.584530] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    0.584530] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    0.584530] Call Trace:
> [    0.584530]  <TASK>
> [    0.584530]  __raw_spin_lock_init+0x3a/0x60
> [    0.584530]  ss_rstat_init+0x4b/0x80
> [    0.584530]  cgroup_init_subsys+0x170/0x1c0
> [    0.584530]  cgroup_init+0x3cb/0x460
> [    0.584530]  start_kernel+0x689/0x770
> [    0.584530]  x86_64_start_reservations+0x18/0x30
> [    0.584530]  x86_64_start_kernel+0x102/0x120
> [    0.584530]  common_startup_64+0xc0/0xc8
> [    0.584530]  </TASK>
> [    0.584530] Modules linked in:
> [    0.584530] CR2: 0000000000000020
> [    0.584530] ---[ end trace 0000000000000000 ]---
> 
> This bisects to the following commit:
> 
> 731bdd97466a ("cgroup: avoid per-cpu allocation of size zero rstat cpu locks")
> 
> Part of the issue is that the comment's assertion that "arch_spinlock_t
> is defined as an empty struct" can be inaccurate.  First, the
> cgroup_subsys structure's ->rstat_ss_cpu_lock field is not an
> arch_spinlock_t, but rather a raw_spinlock_t.  Although this is empty
> in production kernels built with CONFIG_SMP=n, in debugging kernels
> built with either CONFIG_DEBUG_SPINLOCK=y or (in the case of SRCU-T)
> CONFIG_DEBUG_LOCK_ALLOC=y (which is selected in kernels built with
> CONFIG_PROVE_LOCKING=y) the raw_spinlock_t structure has non-zero size.

This was fixed with a patch [0] that was applied to the cgroup tree's
"for-6.16-fixes" branch. It should make its way to linux-next soon.

[0] 
https://lore.kernel.org/all/20250528235130.200966-1-inwardvessel@gmail.com/

