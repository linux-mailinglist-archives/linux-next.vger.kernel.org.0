Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9447F43BD9C
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 01:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235347AbhJZXI6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 19:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235278AbhJZXI6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 19:08:58 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E7CC061570;
        Tue, 26 Oct 2021 16:06:33 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so972618otk.3;
        Tue, 26 Oct 2021 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=qhfQLJOgDvln9IuLBpMPA2NZUQIrC6XLO3bbkhnZKr0=;
        b=T643XUt+TfuKOqk++crkBs0mWZBOYPKhmUKYurHK5hzbDKBydx1CC+kdvwwI1CN9OX
         kEhTFhYFdQi8nuVhkrXaOkkVKDL75G0DziDM8Sz4EXtQtmPt+5JWJkmG9tpFIgB8G6l1
         Uh0MlsSKvDeCOZ5293/wHFBQDF6gMsv/Erxwe5+nupQf1NNnr7SPJTo0Tcy5grjOWwIt
         fg2oCXVsMvV9K/jw44KR1Fv3tASYFCYd8fzDuBwADRQrSRaTE9AbqyrRDTQbIhffI6mG
         x7EA2rNhjX2qWKpop7dl8pMAB1IdaWrmVLECUmeVXrxNwDd0f115RrN5C7i6h+k4vfsz
         7cTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=qhfQLJOgDvln9IuLBpMPA2NZUQIrC6XLO3bbkhnZKr0=;
        b=MsONGzam8R7tk353O2KbCrkd+EG+Y1384eWirLe/HCAxwyxwDC0+Bs2kAuCW8ozpQX
         3+vXHVBLbJR/MEt4xC9HWT1NTVbol3pyUrBiunKjFSeixYQI90HB1FOX0xnRGH/IMrbE
         zsbgukT7GjEWQgtLFyW0hBkYtjrmZkN7NC8X6EtPIagvOSm4epyrtAxtnch8novT88QH
         dpqHnyemOf27pvzySofKL2GJjrI1lDPLIqDMXemhtfAHhzx1rVqvDWjirNMWvdF1JzkM
         STI3CCfTOhQsHFQR4bF4toOwJlYnRk9DuUZxY2naggH307AIVxeuL+aPd1jD7ZLYMiPV
         H+BA==
X-Gm-Message-State: AOAM530SUrHsevkakN4Cyy+um9kseWBBHIJ7X7sPcaNEvhAl60j3sQcZ
        P4WleYEfU3LC7kcIBt8QcAs=
X-Google-Smtp-Source: ABdhPJxk6iZqCbzxcHk7Me3XEtCBaRWXbeKaRStoVgRfFy2huR++yNlXSHMZ8oIa7PPzrdXllnng3A==
X-Received: by 2002:a05:6830:153:: with SMTP id j19mr14207194otp.375.1635289592966;
        Tue, 26 Oct 2021 16:06:32 -0700 (PDT)
Received: from [127.0.0.1] ([179.97.37.151])
        by smtp.gmail.com with ESMTPSA id bn13sm79256oib.37.2021.10.26.16.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 16:06:32 -0700 (PDT)
Date:   Tue, 26 Oct 2021 20:06:10 -0300
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with Linus' tree
User-Agent: K-9 Mail for Android
In-Reply-To: <20211027091705.1e24694e@canb.auug.org.au>
References: <20211027091705.1e24694e@canb.auug.org.au>
Message-ID: <9FB29D99-7F54-428E-912A-A9B025FD7CF3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On October 26, 2021 7:17:05 PM GMT-03:00, Stephen Rothwell <sfr@canb=2Eauu=
g=2Eorg=2Eau> wrote:
>Hi all,
>
>Today's linux-next merge of the perf tree got a conflict in:
>
>  tools/perf/util/session=2Ec
>
>between commit:
>
>  8e820f962345 ("perf report: Output non-zero offset for decompressed rec=
ords")
>
>from Linus' tree and commit:
>
>  3a3535e67dfd ("perf session: Introduce decompressor in reader object")
>
>from the perf tree=2E
>
>I fixed it up (see below) and can carry the fix as necessary=2E This
>is now fixed as far as linux-next is concerned, but any non trivial
>conflicts should be mentioned to your upstream maintainer when your tree
>is submitted for merging=2E  You may also want to consider cooperating
>with the maintainer of the conflicting tree to minimise any particularly
>complex conflicts=2E
>


Fixed locally, will publish tomorrow after regression tests finish=2E

- Arnaldo
