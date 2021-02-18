Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D1B31E433
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 03:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhBRCGo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 21:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhBRCGo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2021 21:06:44 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204B3C061574;
        Wed, 17 Feb 2021 18:06:04 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id w1so1047654ejf.11;
        Wed, 17 Feb 2021 18:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZKvtNdB5oWeKB3+Eet9najSt3YeMmxG2xGM7uO5aLws=;
        b=nKYwmXSATV0YtsHoOQcwbU58hPpWp609qVCUIZD7n2+I6I+x56gcyDz4583RXXnge2
         285GPoH8n4y8tFfqfgmo+O0fsd1+X5T406b3POiEnwGQD1zTCpDzFky5T0BM/bCdvmTU
         Nf71JQ7bbF9gwjXu/pnkVQAuuIb7h74wrrs9Yh4/gZDsOHpzSmdx8E4XX8l6ZiWDXDjQ
         j9uh2QS10/CIFBrEVYeGLqGIIN6QUa5GDBRenAIEbkpbB1ezy3qx98JoQiy3wplX/xzQ
         tPvmOYQtEQxHVqJ/Lmjewe3Bg7yodBXBXNlsxUndHaTGATxZy/rgt9DjT6s+meW1lvVb
         SPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZKvtNdB5oWeKB3+Eet9najSt3YeMmxG2xGM7uO5aLws=;
        b=bx5LdZ4ny9PRf0l2z362JJR7TH/VuZCoEFNwv8dxgmbZ0/fSVC3OXPaEjEhPba7dtE
         TUERPLts5z18W2H6eLYx9dzpBnDa2EssELptreypyNOpnvV97RpKjIiXrocQExLYCE86
         zGrqJijnBUx5diWpj+a9+qFiVXxkH1yryplSHNcj9e58teOoPncgHgKpVlHeuOEJT03s
         c3rfAlY+wyXjZVaYFi6dBKUVzbmE+QyJ3OvMWdsxKEX53F6Risg4BGp2L354VWPd3eoB
         F2lxnl4H/IL76PJqOwU1lSxJsm/wGNm/lyksyx2VEffLXou/a3Nvz/1Q2nHZFq17L3JD
         x41g==
X-Gm-Message-State: AOAM532xdVKDsaWKVxqWeMmX9h0PUraI2f85CdYjhGKSROSLcQHvNTLh
        OLL4uqFeBKbqpYmYcLCf8539u6zcRNUJNEwtpcKvn0w=
X-Google-Smtp-Source: ABdhPJxOHZieN/IYAGPox3s51ea9WJiHnAbKCuYclP73ETDsZIx3teG8b+RFD2Gv1Oinn7uqyfpPgKBocwi6B5DusIY=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr1723870ejb.359.1613613962838;
 Wed, 17 Feb 2021 18:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20210218125657.5cc7bf07@canb.auug.org.au>
In-Reply-To: <20210218125657.5cc7bf07@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Wed, 17 Feb 2021 20:05:51 -0600
Message-ID: <CAL_Jsq+LQ2ykqK7NT_vQHz-z12uhgXMmm-ZgZECErvCpMiCzYg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the devicetree tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 17, 2021 at 7:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   bc5d1d0f8b38 ("Revert "powerpc: Move ima buffer fields to struct kimage"")
>
> is missing a Signed-off-by from its author and committer.
>
> Reverts are commits as well.

Oops, now dropped.

Thanks,
Rob
