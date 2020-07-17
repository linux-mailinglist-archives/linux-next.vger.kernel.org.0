Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9BA223107
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 04:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgGQCJD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 22:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgGQCJC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 22:09:02 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DC2C061755;
        Thu, 16 Jul 2020 19:09:02 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x9so4768764plr.2;
        Thu, 16 Jul 2020 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=mQWYymg3Pd104pis2IhNsO9+PGw6QeS8PPO1z8GPhKU=;
        b=Egxk7JOl9gTuD/ij8L5Z+QdUNjD6rS5I4dbUaFxT9YB/DO6NtUZ4GrFIvtDcgb/UiE
         1g24XG/sAho5PkdtN6RIHDgPYGqpEQYDKgWhFClzNOrThg1Z680paSueuL1u3kARBAu2
         fFfhEapKANjqVgXwmBpESUkBuKVEj8U3HabNAyl9ru+Jz6tTiJwAGKbIcmaa/6glLhjW
         dYOzUVXh/k4GKD8jcN7qGadaW7PkTPBZKMgK0k0Vv4kZbkdGLKUZcUJVlTHVcrbah4Za
         sXM8RIiEqsYMphf/2hu5z5oKSDn2+cDiA7h/233tUmB47TDl1780Kby+e/NDMRY5Enk9
         P8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=mQWYymg3Pd104pis2IhNsO9+PGw6QeS8PPO1z8GPhKU=;
        b=WlzqIRkRD1or3h0zDNDJf+W4tZxaFM2PYAAknzTWUcd3zGt81byCI9ILJPm9Q3K+hm
         Igh/HnCBcfw29Lk5rzZxLDhze2AZ1Ailwe6NBzvP+O6UZHlt29HfZacDgvvEeZXlc20G
         Uft0WSLal67nTgUww7HZPd/ClvrGM3jaap8KHnPB/PviVzePIwbPNBD/R/3YJU2WzvC0
         jxvfe5D02qME2WWdRtg0k3Bti9xY8F0ORHG0YZuli7mzlgjGqnHK3WiTv42DxTfuEKjm
         lKn87Y+kAReA2FHOraoD3CQJABGjkaklIRNI+Dtjttt5NWE23/4eFVeCg0SmBqUxwaq0
         sFMw==
X-Gm-Message-State: AOAM530K1iXF1kfIH/lQfcrud6iD07eyR0XG/PI7GQvGBCGE7r4DZIXP
        4uNqOwCnAFPGiLnMJOlz3RfZPf7L
X-Google-Smtp-Source: ABdhPJzP0xNtaCRHw3hyyHrEYTdSzBXrrQeWoDh62VLKiCP3NT+QW5A1sY59sdtOJ7DJOkumHrhkag==
X-Received: by 2002:a17:902:c697:: with SMTP id r23mr6151150plx.35.1594951742115;
        Thu, 16 Jul 2020 19:09:02 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
        by smtp.gmail.com with ESMTPSA id j17sm5888154pgn.87.2020.07.16.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 19:09:01 -0700 (PDT)
Date:   Fri, 17 Jul 2020 12:08:56 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
To:     Bharata B Rao <bharata@linux.ibm.com>, Qian Cai <cai@lca.pw>
Cc:     aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, sfr@canb.auug.org.au
References: <20200703053608.12884-1-bharata@linux.ibm.com>
        <20200716172713.GA4565@lca.pw>
In-Reply-To: <20200716172713.GA4565@lca.pw>
MIME-Version: 1.0
Message-Id: <1594950229.jn9ipe6td1.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Qian Cai's message of July 17, 2020 3:27 am:
> On Fri, Jul 03, 2020 at 11:06:05AM +0530, Bharata B Rao wrote:
>> Hypervisor may choose not to enable Guest Translation Shootdown Enable
>> (GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
>> permitted to use instructions like tblie and tlbsync directly, but is
>> expected to make hypervisor calls to get the TLB flushed.
>>=20
>> This series enables the TLB flush routines in the radix code to
>> off-load TLB flushing to hypervisor via the newly proposed hcall
>> H_RPT_INVALIDATE.=20
>>=20
>> To easily check the availability of GTSE, it is made an MMU feature.
>> The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
>> handle GTSE as an optionally available feature and to not assume GTSE
>> when radix support is available.
>>=20
>> The actual hcall implementation for KVM isn't included in this
>> patchset and will be posted separately.
>>=20
>> Changes in v3
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - Fixed a bug in the hcall wrapper code where we were missing setting
>>   H_RPTI_TYPE_NESTED while retrying the failed flush request with
>>   a full flush for the nested case.
>> - s/psize_to_h_rpti/psize_to_rpti_pgsize
>>=20
>> v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@l=
inux.ibm.com/T/#t
>>=20
>> Bharata B Rao (2):
>>   powerpc/mm: Enable radix GTSE only if supported.
>>   powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
>>     enabled
>>=20
>> Nicholas Piggin (1):
>>   powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
>>     !GTSE
>=20
> Reverting the whole series fixed random memory corruptions during boot on
> POWER9 PowerNV systems below.

If I s/mmu_has_feature(MMU_FTR_GTSE)/(1)/g in radix_tlb.c, then the .o
disasm is the same as reverting my patch.

Feature bits not being set right? PowerNV should be pretty simple, seems
to do the same as FTR_TYPE_RADIX.

So... test being done before static keys are set up? Shouldn't be. Must
be something obvious I just can't see it.

Thanks,
Nick

