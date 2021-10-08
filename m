Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B77142669F
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 11:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237272AbhJHJYT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 05:24:19 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:48007 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbhJHJYS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 05:24:18 -0400
Date:   Fri, 08 Oct 2021 09:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633684939;
        bh=i8yz2Dg75XXWZjL9bsGvVhDicxEByCAZeWOpe1sB2M0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=XiBRvlEep33rZf0acsxl1nCNw+zCnNV5wgsIn7gZM2q1rnZ6TkhNgQNVMBMrGDprO
         +T8KUCDCDTDDs7iNy2KLjmhMREkwhqy2CbjuOyaOhDStApKAnEwCIenJM7yxaIAsXm
         goN7BoNjgnjZNav9jjTqWOB0H7cip3yldlVyRA0C2Wn9W+i84b1TEa6qUaReUX8mSb
         nqyhagGOjS8fl3e2q+9sOBjP9sTprpC7e5TgqnqYSRcEcJMjbXsR38IEI0j3dnLZin
         1cUj4YrEzU3eRH7myIALI+eIs6+m+KmW+ArxyllS9UN5gcjYvw2vWZl/CDV9luD5Wp
         LgNKSa5eia3nA==
To:     Stephen Rothwell <sfr@canb.auug.org.au>
From:   Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr>
In-Reply-To: <20211008192910.600a188d@canb.auug.org.au>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr> <20211008192910.600a188d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, October 8th, 2021 at 10:29, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:

> That symbol (get_mm_exe_file) is not exported to modules.

I see this:

    EXPORT_SYMBOL(get_mm_exe_file);

in kernel/fork.c
