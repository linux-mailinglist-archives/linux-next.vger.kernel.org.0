Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2556E9A5D4
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 04:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403949AbfHWCzA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 22:55:00 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33317 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403948AbfHWCzA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2019 22:55:00 -0400
Received: by mail-ed1-f67.google.com with SMTP id s15so11107504edx.0
        for <linux-next@vger.kernel.org>; Thu, 22 Aug 2019 19:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D7GDdjrq1NeZXj1CVJ58BWK5WaZspIPhaIUbOgarC3M=;
        b=QbZJ68+01jVREbSLitCBk6yItVAVSMh5xY3L6uEKdCDnMSkHlVeWjONN33nuh/kLz5
         SwV6fjMz0+AYjSin7VFT+TMlT3SUcnHBtfb2VEFKipuYM6xQRD7hgbWqJZDq0JWXg/bP
         hfwUnXlhdMQ8H2jQpRLlJBABr5/Z0iB9Hh95vxA1v/TvsXdV1gTFK2d2wgyReYqHJIX6
         jwC5D0ik+tYuEFpFox7YrXcTuPY85G3Qo2soT/VQP2E7Duub6UOIcQy+BlMx8gW316EF
         JuFdTP/Jd2Wj09vhNnhZNfAW/NFNI8JanzVbMhozcnSWj6ya8/NxcWraozrktlDMZje2
         XGGQ==
X-Gm-Message-State: APjAAAUfHUOOV9IDUKc2gILbonpYpyUzjX9P9kUAd52XvQWVBhIQ1+rf
        FnkC1UhqPweIXUs3eFT+qEhFBKHzugs=
X-Google-Smtp-Source: APXvYqxRurTb3MLugoBGJASeLHEh19HESjtJ5dip1ETRmS+SEvZ3WYWbwTxN3Zb/ll0veFXMhRfCYg==
X-Received: by 2002:a50:bb0b:: with SMTP id y11mr2005535ede.125.1566528898076;
        Thu, 22 Aug 2019 19:54:58 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id o1sm190052eji.19.2019.08.22.19.54.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2019 19:54:57 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 10so7457004wmp.3
        for <linux-next@vger.kernel.org>; Thu, 22 Aug 2019 19:54:57 -0700 (PDT)
X-Received: by 2002:a1c:eb0a:: with SMTP id j10mr2140226wmh.125.1566528897422;
 Thu, 22 Aug 2019 19:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190823073545.647ec7d1@canb.auug.org.au>
In-Reply-To: <20190823073545.647ec7d1@canb.auug.org.au>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 23 Aug 2019 10:54:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v65oj=o_0O=BZMUcADycrunKuSpvSmA1=Ey2UZWPV7H=uQ@mail.gmail.com>
Message-ID: <CAGb2v65oj=o_0O=BZMUcADycrunKuSpvSmA1=Ey2UZWPV7H=uQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the sunxi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 23, 2019 at 5:36 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   c60e09f77c83 ("ARM: dts: sun8i: a83t: Enable HDMI output on Cubietruck Plus")
>
> is missing a Signed-off-by from its committer.

Looks like Maxime rebased something and missed adding his SoB.

ChenYu
