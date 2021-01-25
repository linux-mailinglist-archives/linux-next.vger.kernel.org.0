Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782CE302A67
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 19:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbhAYSgn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 13:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbhAYSgj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 13:36:39 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA21C061573
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 10:35:57 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id m1so13319977wrq.12
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 10:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=bU25KFC9HLHJZBPysE8AYb86utctlsLP3cmLZ/EkUSY=;
        b=x4YgJ5rv/0WKriAHnBnyfT0fsKE80cbRsYgnZDwLRvuvxjTtRICHMuiaizxE6A5E1Q
         6QQOuXnXSnAbboEgt3rPkM1eyfmdolW1osKmMUhwHmIWCL4bzakvTNxce+ZItuzE7uCK
         RuzR0DPgP9zxOmO40m/boJMfZ5uIXfiOjEpmaFZGeIGt/3Rx3qE2SWglxjzfJMblLJ+J
         ks38OCyFzdhD69SPAVF/R7zJX9fXGnzZr6R0KZCU6Mq2I70GNoBdegkiUR18qv7eiiR2
         5yeOB6ZPJoiy05gVawnlz8C4Q2keu6738SYWgpoG93mipWkHK2Xsl8nrfT/c639b5HTY
         ROlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=bU25KFC9HLHJZBPysE8AYb86utctlsLP3cmLZ/EkUSY=;
        b=r7BWkXHkFQK9BWfoiB4GX0iYNettV49bmecQ4bLRLlZ6MiOmiRzbUxTGtEPc83vtOv
         QM/jGiYXi7mBBxtkmoIV6ObXHdp/dG6CJR3cWyiro74SlO29wNv+REJ7wx27OgKmK136
         lacQGhaWLX5jfpCFopVkVc0/ek+AxzZ+kSJ0EuLn5d+NMwZb8lIwzdjGVIq8dGjNmR1D
         KTh3SLsFBmWBaIT3fJehVOrXy3M1d3vjvCJLU/u00bhx3BMzfHsAte4zn5OKkKaWcw4o
         YIV9vXfqDpn2u/PyeOLJi5KHPJUP/VI1P2oL2QLmJhAhva3sKyDIfPtBAKqw4LwxPpNb
         6IFA==
X-Gm-Message-State: AOAM533d4vF3j2Yld5GTJF+k+X1RlpNtHhf4wcNGT0mtXcCjD7UStPkb
        f9E3HeUIch38rdDGB4mU0ze0pA==
X-Google-Smtp-Source: ABdhPJzvJKSwCJu9yEWggt0kR/3mbJGqiE+6E0zcTL9rN/OpM2JfhffI+zCS1nrClI1pRHy9Ic1dHw==
X-Received: by 2002:adf:e642:: with SMTP id b2mr2445501wrn.221.1611599755877;
        Mon, 25 Jan 2021 10:35:55 -0800 (PST)
Received: from [192.168.159.233] ([37.160.159.175])
        by smtp.gmail.com with ESMTPSA id c18sm756535wmk.0.2021.01.25.10.35.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:35:55 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: linux-next: Fixes tag needs some work in the block tree
From:   Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <20210125204032.6b6a604b@canb.auug.org.au>
Date:   Mon, 25 Jan 2021 19:35:49 +0100
Cc:     Jens Axboe <axboe@kernel.dk>,
        Jia Cheng Hu <jia.jiachenghu@gmail.com>,
        Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3F91181A-EDF2-4F01-9839-17B40D6EA07F@linaro.org>
References: <20210125204032.6b6a604b@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3445.104.11)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> Il giorno 25 gen 2021, alle ore 10:40, Stephen Rothwell =
<sfr@canb.auug.org.au> ha scritto:
>=20
> Hi all,
>=20
> In commit
>=20
>  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in =
waker injection")
>=20
> Fixes tag
>=20
>  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally =
inject their I/O")
>=20
> has these problem(s):
>=20
>  - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally =
inject their I/O")
>=20

Hi Jens,
how to proceed in such a case (with patches already applied by you)?
Shall I send you a v2 with only this change?

Thanks,
Paolo

> --=20
> Cheers,
> Stephen Rothwell

