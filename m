Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E4B2DA0C1
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 20:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501915AbgLNTnJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 14:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439971AbgLNTnB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 14:43:01 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61032C0613D3;
        Mon, 14 Dec 2020 11:42:20 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u18so33184702lfd.9;
        Mon, 14 Dec 2020 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/t4z4WwZ36NZTAJ5eyPXe30LddGYenvCpdMm+/jg/bY=;
        b=gOLbBg/EeBwd1LNpx+M7RmO7pYnBO/wrdsnLLt3FIFWQQCaWRGiNmo798ODVMN+ju/
         BCKdxlGkURm+U65VzYk+PxltxNiTy1JtSRU1rUO+jgFM5uptlRPp2HgyafRukDrP0UFJ
         UwKM5A0N5jc/w/cxis53KlRETa7z8F/ZsXYSBh+W/7DGkxpf0wSoTi9B/Ng7hd2tYbOn
         Lc7wUBIVhRuQM/SQI3So7FBZ4QIQM9xcENQHfdAPP3s3Bkv4eersCN+yN9hVRDQxxopV
         zFvEMewtOzgLTL3nAoI2UGRqm+psl8EHMVmUh7P+1QnZJmpR8JkEKvF5MsfikyoYSsNI
         M2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/t4z4WwZ36NZTAJ5eyPXe30LddGYenvCpdMm+/jg/bY=;
        b=fZzUx+qKn4FNx3ZNGLKgpN6yKhCf9JrVaNjc3lze3jO4asEv4Dbe3n7gBPS7V3RY7M
         CQXtetFRSxgBmzOv6M7y12t0uWnC60aaQL+GF4OQXJqUkmbLTyEvnUtcia0xDAhsrXgw
         uuT2YJgpt07nZTmOxyM8d1K44N14CfYkYVhahFG36xLtbtuoc0R/xT+PNuMeqPtmT604
         jdQ2RLXA3x/Q+aMZkm4CgNAjw1MRxvB+peudPS95xMA5jQjSJvXp7wWILV6ujeP4mzQo
         ndgYtoZ58DTqkxUjS9LWxIICBf0xpstJbvpAZisLRRgS1rm9MNvyDmT+ds9Jo5GtZ8mf
         q7ZQ==
X-Gm-Message-State: AOAM530uloYreivA1mJsiaji+ord24ia0qqV2kATTzNsVMdD04EEsOut
        dOZ166xB1BWHg14FQqvRFLvB3rAkzChbKMSfa8MpSQg1wZ4=
X-Google-Smtp-Source: ABdhPJxbRo8k+1r98gg2svxCgmwQqePl6KchVviBdtK329G2One8zxj8IDdilsVFDLjCKZUAtLuYbd1T11aaBUFsuGY=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr10826067lfr.175.1607974938823;
 Mon, 14 Dec 2020 11:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20201215063243.236b2a60@canb.auug.org.au>
In-Reply-To: <20201215063243.236b2a60@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Mon, 14 Dec 2020 13:42:07 -0600
Message-ID: <CAH2r5mvbBjDQiaT9RPzkyUmmXeT5tAukrCvrrzDej3F592fx+A@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Mon, Dec 14, 2020 at 1:32 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   425f40482491 ("cifs: fix uninitialized variable in smb3_fs_context_parse_param")
>   8cc9a66ea70e ("cifs: update mnt_cifs_flags during reconfigure")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
