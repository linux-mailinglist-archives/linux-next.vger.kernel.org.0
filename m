Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39593423D8A
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 14:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238260AbhJFMTH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 08:19:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238149AbhJFMTH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Oct 2021 08:19:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 344BE610A8;
        Wed,  6 Oct 2021 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633522635;
        bh=zhaIhy9xAWppuinFCPt2q5Eyec8s/90iX3C8CxUoCi0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kqsm0tT+vh54LOLFeFBLCGiZTLW3VaaxH3BJ/OSZDFDTJHKcuF0TIPtW3PAOvZ01D
         iLXn2WFhDlOHOaZk5U5DaUbzU36SMCSbEoxD12iGYIHQMd0Q5TKFy5ob17fpn1GsKI
         6zIT3M1K36HBSsLTgjd+DfRLW2AVUrHht0/Bp3+bKoFuWGfex3LlNCzr7peuQIh8sC
         rM6ujiKjMgfamivufFatRovu0V5fnmgUnKppCpYGVVkOKPP0BsjafR3Ev0uAomvG1u
         gfBiLj266duQ+D5l3PZyhAFHhbBjaaD40n7SPZxXEn6O8qACk3wX5Zkx2fH2vnyeEQ
         BPfankRyC1+rQ==
Received: by mail-oi1-f171.google.com with SMTP id s24so3716522oij.8;
        Wed, 06 Oct 2021 05:17:15 -0700 (PDT)
X-Gm-Message-State: AOAM531TKPSwnlbfh0uTko5Y3rdkdMSA9KltOEWIYEFy8VQDjpirNpAh
        se3nLpiivccs41P1a3WIZBKeeYiGZGawlBZSfew=
X-Google-Smtp-Source: ABdhPJwhXFikBhe7REfEQjccZwTIt+uypowQ8cYyzj97z3cDfXW6byjpMWFIcNtY5olDQNsfrZ5uo7JsT652siLJRe4=
X-Received: by 2002:aca:3081:: with SMTP id w123mr7103442oiw.114.1633522634545;
 Wed, 06 Oct 2021 05:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211006080520.1a7e34fc@canb.auug.org.au>
In-Reply-To: <20211006080520.1a7e34fc@canb.auug.org.au>
From:   Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 6 Oct 2021 20:17:03 +0800
X-Gmail-Original-Message-ID: <CAJBJ56JkgjuqRe6hfnkeMemLLpRcjHh4eTzt3irC1QQ0L1Xfzw@mail.gmail.com>
Message-ID: <CAJBJ56JkgjuqRe6hfnkeMemLLpRcjHh4eTzt3irC1QQ0L1Xfzw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the imx-mxs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 6, 2021 at 5:05 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   7c4a8b989a99 ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
>   5b340e7813d4 ("soc: imx: add i.MX8M blk-ctrl driver")
>   592d47ea2f24 ("soc: imx: gpcv2: support system suspend/resume")
>   be4756d4bb83 ("soc: imx: gpcv2: keep i.MX8M* bus clocks enabled")
>   d0118b6be392 ("soc: imx: gpcv2: add domain option to keep domain clocks enabled")
>   68c3c82c034f ("soc: imx: gpcv2: add lockdep annotation")
>
> are missing a Signed-off-by from their committer.

Fixed.  Thanks for reporting, Stephen!

Shawn
