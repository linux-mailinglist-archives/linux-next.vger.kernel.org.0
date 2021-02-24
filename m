Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D225332350A
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 02:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhBXBOB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 20:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbhBXAfT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 19:35:19 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBBEC0617A7
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 16:34:05 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u4so349924ljh.6
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 16:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vF7F/YfjrUV7i8G4F7JJg0GaVxlhAz8y2lLIBvTolGs=;
        b=R6rhwbibBYZfR0wRPEZZe1mYiCGuRMMhoYXWj7TvwvTXNVSgjD/1qgPSKv3q04Hdvb
         LlVWnaI26z3SMkymarqseBOJxqSKT14HCFEHhXeD83bQCBaSRq3kca75dXn5gGTOaSZd
         pxfB2RThU3RMWxDsWXTf5V1GLSChgFVScH4I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vF7F/YfjrUV7i8G4F7JJg0GaVxlhAz8y2lLIBvTolGs=;
        b=j2Br1Ir8o0LbrPW3mpCR4wfkiZ88sJRPCm16LaJ9ZMfKTDpk8xA6EDUvypXvtarpUY
         /xoB9al7Eq0I+XLoDrYvSsNqbeDPuZiGG/WTgbWqkV/pVXyjwnZ2E75h4WLZcfIIvvnz
         FOyFP9Ie4TV7iKBMDDV/RthkcYu6/8TwatG70ys/uDZF8JBAHZj2XXVyDF6ParD3scNS
         A7ukI7OboTnvdKAPfXNWNHjtcaKD+FBEWCEpW1v4khyW6/D4qsVR67YRmMSQFG2whHkl
         +e5fNfyTWGAvVXRZ0WGXFwMSxE8qlV075dGnQNpMHIfjK3HzCC46BL6GSyilivPq+HY8
         dPNA==
X-Gm-Message-State: AOAM531N9YcatxW7y/CI69WFcDaZPWVBitYIeaO1T70TWM4pk8OTovA3
        QphUeK5v66Sb2Wxe+Htstfq08HjT7iPpAA==
X-Google-Smtp-Source: ABdhPJw63bxVsIbI22+4kmaImBGhbzc5CHfsILOBjZXhCG8RrY+d6AOV3TFVjYTq2/xGUJfocxhjyA==
X-Received: by 2002:a2e:b4ed:: with SMTP id s13mr18002800ljm.118.1614126844075;
        Tue, 23 Feb 2021 16:34:04 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id p24sm88778lfe.27.2021.02.23.16.34.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 16:34:03 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id v30so438340lfq.6
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 16:34:03 -0800 (PST)
X-Received: by 2002:a19:8186:: with SMTP id c128mr17747117lfd.377.1614126842985;
 Tue, 23 Feb 2021 16:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20210224113108.4c05915e@canb.auug.org.au>
In-Reply-To: <20210224113108.4c05915e@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 23 Feb 2021 16:33:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi1FEJfk9r4Jw90kU3aayXka4Y4HOWdgAtVQHRFTgpQ+A@mail.gmail.com>
Message-ID: <CAHk-=wi1FEJfk9r4Jw90kU3aayXka4Y4HOWdgAtVQHRFTgpQ+A@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 23, 2021 at 4:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> are missing a Signed-off-by from their committer.

Gaah. Maybe I should do some pre-pull hook or something to notice this
automatically (like you clearly do).

            Linus
