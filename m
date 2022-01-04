Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E4F484833
	for <lists+linux-next@lfdr.de>; Tue,  4 Jan 2022 20:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbiADTFi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Jan 2022 14:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbiADTFh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jan 2022 14:05:37 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200C9C061784
        for <linux-next@vger.kernel.org>; Tue,  4 Jan 2022 11:05:37 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id j6so152151430edw.12
        for <linux-next@vger.kernel.org>; Tue, 04 Jan 2022 11:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHZhRecbnrNsV806lQ/AQDXL1uUWSl9+nsQtoz3J/w8=;
        b=kIQ8iSft5GaKN+9oQIid+73JnrPvFMIXxPg0F8iPF+BNEiwmQb+x9aeUdOAUe2mEUG
         xlb/CMmmelIWhKhoVdYx9hoBrPCWurf7qfPGceQ6qUiPI1GKuxKM1t/H3QyJrlzUksaH
         W80l4BnpjtSCEOZ+idx+xgR19Ppv7RmSxkb0Zbl164h73AR102R2PfTpeLWx4ZB3wAw9
         DwrqzH1I0vFUYllj26MRRs6U1IonbteyjtESNvnSnpF1D3kSqKtJoFUgBXUtSG2vOuWR
         6UA45Sip421Y8uiF+QrJOCaGjuzKNYo2NR3jM2sj3+xSv/BDbUzL4IbxUmDjONUsmrTN
         bLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHZhRecbnrNsV806lQ/AQDXL1uUWSl9+nsQtoz3J/w8=;
        b=jpvx2vWwkhfclGkNqMXOTc6SVhG1CGUn9MoNYdzEyA7kio0Xxd01Bb/LeiTimz1jT/
         v4Kn2Sot36WkmzHwNExg4Zv9z/IcyW5Tg53S1bS32xmkVpYjoVEgvUAI6nN4emg0edmB
         iXoipbipXg76prO0vMvKJ3PPHh6my5GkNnmx7bjFI0tXaaY1nGEVVTvk/fYlzemcxKFj
         2DiiaLgK8SpF5SesEmuOjD82HY3hxOg2nmWlt2HrvFaBGFExHpRcn6VoZYwogVAs7XPz
         2TuZ2JV09THuok66nYtQz1pENu5XfaizDna/q2ZkfWvjQTYfPBHUwQe9S1Ueh9xSFRwh
         raHg==
X-Gm-Message-State: AOAM531eJt09jC6KsLB9fT7eoDZy1OeapdPVwmgxKtGPnX2YG/J6Tn76
        1OS0H2UXoSIAsv010/wHac3HBai7mR5NZ8jxdKX5eQ==
X-Google-Smtp-Source: ABdhPJy1U9UZkiHyOLoaOWBfMCy+IkS8ik/+Jb2NIaOBUMF01ZJ1DZtKRWC/LpVn22Okz4J60JbTUEqPC7IeQnStHB0=
X-Received: by 2002:a17:906:7954:: with SMTP id l20mr39916216ejo.358.1641323135363;
 Tue, 04 Jan 2022 11:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20211224163256.2a0f01af@canb.auug.org.au>
In-Reply-To: <20211224163256.2a0f01af@canb.auug.org.au>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 4 Jan 2022 11:05:24 -0800
Message-ID: <CAGS_qxrmxi3a9-HGxQMwJhPnR4xfzvYFOn36QcqDgitoHdfwHA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the jc_docs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harinder Singh <sharinder@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 23, 2021 at 9:33 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the kunit-next tree got a conflict in:
>
>   Documentation/dev-tools/kunit/index.rst
>
> between commit:
>
>   6c6213f4a29b ("Documentation: KUnit: Rewrite main page")
>
> from the jc_docs tree and commit:
>
>   58b391d74630 ("Documentation: kunit: remove claims that kunit is a mocking framework")
>
> from the kunit-next tree.
>
> I fixed it up (I just used the former version) and can carry the fix as

Thanks for this.

Harinder's patch should supersede my small fixup patch.
It wasn't clear when Harinder's patches would land in the docs tree.

But it looks like my patch two files that Harinder's didn't, specifically:
 Documentation/dev-tools/kunit/api/index.rst | 3 +--
 Documentation/dev-tools/kunit/api/test.rst  | 3 +--

Shuah, Brendan: I can send a new version of 58b391d74630 that only
updates those two files, if wanted.
Or we can go with Stephen's fix, which looks good to me.

> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
