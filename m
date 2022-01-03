Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF0D48384D
	for <lists+linux-next@lfdr.de>; Mon,  3 Jan 2022 22:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiACVVz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Jan 2022 16:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiACVVz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Jan 2022 16:21:55 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22E9C061784
        for <linux-next@vger.kernel.org>; Mon,  3 Jan 2022 13:21:54 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t26so72123229wrb.4
        for <linux-next@vger.kernel.org>; Mon, 03 Jan 2022 13:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Lzy/MfgdFZ4iDKVXnsjSAD8AfuZVcK9H61Xlb+UqGaU=;
        b=Op27sWTOcZkn56Qz63rLM1QKvlqnIRVDWsUOazolG5OPs8tIzGlpKY+rh9YFlbTWwV
         FsCna/25uEwt/78b3vlJbWKGVBwQ5UtP+FMsqlr3yjMvp2Q4i1jcJqsx3QZIhkVD++fa
         tuFZraMf3bkXkIagQgiOgo0hfmf9nqFplqqfTR94sp9q9kt/t7ffkzEaW2Hl/AwEz+LF
         DDcpafNce25lcuhDEr6NL19IvTixc2mBlQ6nhgDFQ6SNiA6L/8BtfosI5+0WesZUIwEO
         0UGYkUVRD+8ifr0OeojFfizuyFZQWeeVjhfUeeFKq2+BGnbHGEJzzwJO/brxrgBf7reo
         V5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Lzy/MfgdFZ4iDKVXnsjSAD8AfuZVcK9H61Xlb+UqGaU=;
        b=Mz6a1MfrUiktvVT+u0Nzl6EqShKOype/PmYlm89z/ogncHrQl07E1QDiwaszFRE8VK
         brEzt+vVFfyPiNFK3KlQZfmoJhWZsTrEKMdt5uo1P5p1oCwBfWEGG2gsCpCLQfjxa4jY
         l2UKbXW4neMUwNFHkREU0/toIMDpGFhWSAiHwKtcTTgn07gOJSYBVz0iOPyJXtUCQ1Ub
         XyLkdoALaWX25HVDH1acbh7tFgZovX64ie5ZKwjh9qCUqFm46y4Y6yttq8drTAVVCl7F
         KHeoCkQMX0n0kgeApZmnpotjJyY/CsUdQ37m0KUfp9TvsCUj015z6+1Md9awdCi7/qIo
         Nb7w==
X-Gm-Message-State: AOAM532Teax4yGUkxcETTCd61Is8zymvpUSiGU8J+gXVPz22pd/pADSW
        OdbNDJzsHLMoNgAMh3Kp6pnKjw==
X-Google-Smtp-Source: ABdhPJyFZ7Qc4XCn2kfCjv01/RFQJMG1R+s0kDxFSbLCzCos4L8l225WeFD64C3BgXZPv9gPZ4wG+w==
X-Received: by 2002:a05:6000:1a8e:: with SMTP id f14mr39063593wry.635.1641244913460;
        Mon, 03 Jan 2022 13:21:53 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id l7sm36086504wms.1.2022.01.03.13.21.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jan 2022 13:21:53 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: linux-next: Signed-off-by missing for commits in the pm tree
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220104081534.5bd47f87@canb.auug.org.au>
Date:   Mon, 3 Jan 2022 21:21:50 +0000
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Bob Moore <robert.moore@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D705597A-C89B-4C39-93EF-416193BC3A40@jrtc27.com>
References: <20220104081534.5bd47f87@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3 Jan 2022, at 21:15, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> Hi all,
>=20
> Commits
>=20
>  a3e525feaeec ("ACPICA: Avoid subobject buffer overflow when =
validating RSDP signature")
>  339651be3704 ("ACPICA: Macros: Remove ACPI_PHYSADDR_TO_PTR")
>  5d6e59665d8b ("ACPICA: Use original pointer for virtual origin =
tables")
>  ca25f92b72d2 ("ACPICA: Use original data_table_region pointer for =
accesses")
>=20
> are missing a Signed-off-by from their author.

They=E2=80=99re commits I contributed from CheriBSD (our research fork =
of
FreeBSD targeting CHERI/Arm=E2=80=99s Morello prototype as the reference =
POSIX
OS) to upstream ACPICA. Upstream ACPICA did not ask for S-o-b, and I
don=E2=80=99t see why you should need them to import them into Linux; I =
highly
doubt every vendored bit of code you=E2=80=99ve vendored downstream has =
an
associated S-o-b. The patch series (which I was Cc=E2=80=99ed on, and =
would
rather not have been; Cc=E2=80=99ing any upstream ACPICA contributor =
with Linux
kernel patches is, to most, spam and obnoxious) is just merging the
newer upstream ACPICA version by extracting the individual upstream
ACPICA commits and mangling them for applying to the kernel.

Jess

