Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF6A3F8B36
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 17:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242912AbhHZPjH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 11:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhHZPjH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Aug 2021 11:39:07 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8429C0613C1
        for <linux-next@vger.kernel.org>; Thu, 26 Aug 2021 08:38:19 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id fz10so2509537pjb.0
        for <linux-next@vger.kernel.org>; Thu, 26 Aug 2021 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=oUs/jjZtn2XewEttzNEDdIF8MeRUjz3cA8OEhNCVVME=;
        b=X0L4RUK3WfnWQMs3PGdMYXHjJIkZJ1aFGbLqh5rzyeyReXL7glmsCvi6nnSLWIdYX2
         YnjzyPyx/pRJZ5Oemf46dPUZ7VTZ1ZZXgOVxqRYGogcm1Kt1xK2sD5Akw6UqFTd1rPqL
         KvwtvrH7+Yuch/7NswpSQVHd8K+s7uwzDOboc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=oUs/jjZtn2XewEttzNEDdIF8MeRUjz3cA8OEhNCVVME=;
        b=Xll6RsfcWvQ7yovXJgxoMxFG8Hsrum1eKFFuCYOmTsCc/xdeIQfpMqm4uDv1mko3uH
         48tpTl/XcubBn7/IIcipQ3MpJQJTwAMGneSiQhvWxhUvgMiT5/UOq65G+CpYGkfqsVOo
         QL3VyAvEhhmOaVD+W4RlQwLhEA0b3fVukgpI2C5i4q2Kihivuzbyvuh6E5Bgh3HzU/ou
         0H/s/sGCsYj3uf3Ukl3NzgOarEeSWNG+58Yogfjxcpggv4sARWbdfVb7Qfr/+zzTospX
         gu06QaLz/EZrPapaC57d3+lbBdWHaKE6hdVrRZcuooB52KW7uMdbtlHJv+e5pZTZDVkr
         eK0g==
X-Gm-Message-State: AOAM530ISsDsaACTFzOwLIISPri5OzDEzFhiEWQX98D1c+RUBpHNcxjk
        dn91yrXlyD0D3h5hX1NsMP4MZg==
X-Google-Smtp-Source: ABdhPJwCxQE8vAzPZcTUQkpnlPEGPRiqzmSrU4gF3yFYyq3xbOoEtWNTygyq9dWsA2jScSS+OFrghA==
X-Received: by 2002:a17:90a:7884:: with SMTP id x4mr17939059pjk.53.1629992299294;
        Thu, 26 Aug 2021 08:38:19 -0700 (PDT)
Received: from ?IPv6:::1? ([2600:6c55:4b00:c768:1835:a5a0:2702:1052])
        by smtp.gmail.com with ESMTPSA id n1sm4112693pgt.63.2021.08.26.08.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 08:38:18 -0700 (PDT)
Date:   Thu, 26 Aug 2021 08:38:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
User-Agent: K-9 Mail for Android
In-Reply-To: <20210826175205.708b88a8@canb.auug.org.au>
References: <20210826175205.708b88a8@canb.auug.org.au>
Message-ID: <FF1867A4-5530-4CBB-84B9-C31622B6795E@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On August 26, 2021 12:52:05 AM PDT, Stephen Rothwell <sfr@canb=2Eauug=2Eor=
g=2Eau> wrote:
>Hi all,
>
>After merging the kspp tree, today's linux-next build (x86_64
>allmodconfig) failed like this:
>
>In file included from =2E/usr/include/linux/posix_types=2Eh:5,
>                 from =2E/usr/include/linux/types=2Eh:9,
>                 from =2E/usr/include/rdma/rdma_user_rxe=2Eh:37,
>                 from <command-line>:32:
>=2E/usr/include/rdma/rdma_user_rxe=2Eh:134:24: error: unknown type name '=
u8'
>  134 |   __DECLARE_FLEX_ARRAY(u8, inline_data);
>      |                        ^~
>=2E/usr/include/linux/stddef=2Eh:42:3: note: in definition of macro '__DE=
CLARE_FLEX_ARRAY'
>   42 |   TYPE NAME[]; \
>      |   ^~~~

Thanks -- I've fixed this now=2E Typo in conversion=2E :)

-Kees
