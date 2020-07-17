Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5A6223140
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 04:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgGQCoH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 22:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgGQCoH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 22:44:07 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31CFC061755;
        Thu, 16 Jul 2020 19:44:06 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so4802176pls.4;
        Thu, 16 Jul 2020 19:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=w5FQOJ2bhrHb7V6Lt6vrUOFn+bVFmILj2GiQ4/rENs0=;
        b=X33Ec6DvC192ZrITek6jJRclA8QfECtXDVVlpuHTB2kwbLPOMfCFpooIUidL4k7gEO
         z1EGNgu7DblyUH+Rnq6ag40SRSGk+FWo6OlKKPDTBSRwmrRnTP4UJyzujUAQKWqVUZdy
         ZjyNwUcXEbCJBWXAbgvnbSnKGeYKywd2H+YdKbnwnPe8x57E7x7ZhyxfFtlfifEMLbpB
         nmSgG81AsDZ3Sas4RPdBNWh+Fpuf/nUg4sSSjCDSn3qdd18KC9deLP4ZH9iFXIqazUq1
         wToqU7l7q2iF6lFWWra0O11oLWXjZUG84YrFtcc1lzyebA96CDy6BgTxspOffQgthHNb
         yTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=w5FQOJ2bhrHb7V6Lt6vrUOFn+bVFmILj2GiQ4/rENs0=;
        b=COekNJ2LXqpyXOvGgEHvvHCGbvT0W+Bpas1SryknG9d9dfw72algaZvffiut25WChY
         pabW9OkGfVaxby7wkNGL13WH4dz78M7Pt4lmtgpAUaL9eAS9w+VyokkE2rRjOWBg1j43
         RVK+FIq4HWvK8oblyutwi8nS6vdRJYybA0B/LhaIy2CVLDV+z0k88PrPG6576HrFB0aP
         o0XvlLrVqYnfi/W42FmxAG27b/0ROKkyUJF4l0aQ2zIXdkmobDrCkyShYibgjDrjFLtq
         Ths0OpQ2noBzGfdRS7Ugb2i/jxN2+tEzfBOogcKb1vrRDkJeEoWMTC3s/Dxl65a1vMCM
         NkcA==
X-Gm-Message-State: AOAM5301FeBMPBfh+48QwCSbrss48umJGlQgDKHO7Kmxw3lEEncycAto
        tj2dkRt0YjWZzI8rYNqp6lQ=
X-Google-Smtp-Source: ABdhPJwhN9BwHoyKknm+sebL4Xd9yXgwaO3yVjPQ8uKkswLr7lMFUeZE8yQZfYPGyFPODyFrF7RtjQ==
X-Received: by 2002:a17:902:6a82:: with SMTP id n2mr6079625plk.27.1594953846351;
        Thu, 16 Jul 2020 19:44:06 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
        by smtp.gmail.com with ESMTPSA id v2sm1146479pje.19.2020.07.16.19.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 19:44:05 -0700 (PDT)
Date:   Fri, 17 Jul 2020 12:44:00 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
To:     Bharata B Rao <bharata@linux.ibm.com>, Qian Cai <cai@lca.pw>
Cc:     aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, sfr@canb.auug.org.au
References: <20200703053608.12884-1-bharata@linux.ibm.com>
        <20200716172713.GA4565@lca.pw> <1594950229.jn9ipe6td1.astroid@bobo.none>
In-Reply-To: <1594950229.jn9ipe6td1.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1594953143.b8px5ir35m.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Nicholas Piggin's message of July 17, 2020 12:08 pm:
> Excerpts from Qian Cai's message of July 17, 2020 3:27 am:
>> On Fri, Jul 03, 2020 at 11:06:05AM +0530, Bharata B Rao wrote:
>>> Hypervisor may choose not to enable Guest Translation Shootdown Enable
>>> (GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
>>> permitted to use instructions like tblie and tlbsync directly, but is
>>> expected to make hypervisor calls to get the TLB flushed.
>>>=20
>>> This series enables the TLB flush routines in the radix code to
>>> off-load TLB flushing to hypervisor via the newly proposed hcall
>>> H_RPT_INVALIDATE.=20
>>>=20
>>> To easily check the availability of GTSE, it is made an MMU feature.
>>> The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
>>> handle GTSE as an optionally available feature and to not assume GTSE
>>> when radix support is available.
>>>=20
>>> The actual hcall implementation for KVM isn't included in this
>>> patchset and will be posted separately.
>>>=20
>>> Changes in v3
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> - Fixed a bug in the hcall wrapper code where we were missing setting
>>>   H_RPTI_TYPE_NESTED while retrying the failed flush request with
>>>   a full flush for the nested case.
>>> - s/psize_to_h_rpti/psize_to_rpti_pgsize
>>>=20
>>> v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@=
linux.ibm.com/T/#t
>>>=20
>>> Bharata B Rao (2):
>>>   powerpc/mm: Enable radix GTSE only if supported.
>>>   powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
>>>     enabled
>>>=20
>>> Nicholas Piggin (1):
>>>   powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
>>>     !GTSE
>>=20
>> Reverting the whole series fixed random memory corruptions during boot o=
n
>> POWER9 PowerNV systems below.
>=20
> If I s/mmu_has_feature(MMU_FTR_GTSE)/(1)/g in radix_tlb.c, then the .o
> disasm is the same as reverting my patch.
>=20
> Feature bits not being set right? PowerNV should be pretty simple, seems
> to do the same as FTR_TYPE_RADIX.

Might need this fix

---

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9cc49f265c86..54c9bcea9d4e 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -163,7 +163,7 @@ static struct ibm_pa_feature {
 	{ .pabyte =3D 0,  .pabit =3D 6, .cpu_features  =3D CPU_FTR_NOEXECUTE },
 	{ .pabyte =3D 1,  .pabit =3D 2, .mmu_features  =3D MMU_FTR_CI_LARGE_PAGE =
},
 #ifdef CONFIG_PPC_RADIX_MMU
-	{ .pabyte =3D 40, .pabit =3D 0, .mmu_features  =3D MMU_FTR_TYPE_RADIX },
+	{ .pabyte =3D 40, .pabit =3D 0, .mmu_features  =3D (MMU_FTR_TYPE_RADIX | =
MMU_FTR_GTSE) },
 #endif
 	{ .pabyte =3D 1,  .pabit =3D 1, .invert =3D 1, .cpu_features =3D CPU_FTR_=
NODSISRALIGN },
 	{ .pabyte =3D 5,  .pabit =3D 0, .cpu_features  =3D CPU_FTR_REAL_LE,
