Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBB83EA658
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 16:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbhHLORl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 10:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbhHLORk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Aug 2021 10:17:40 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5CCC061756
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 07:17:15 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id nt11so9833546pjb.2
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Pch++DVEjAnWg+xt4kEu7hkcd3VsPliA8XsFfWS3u4E=;
        b=ChjtkxID7AdLnbi3aFhoaikWk0/pxeZO8Exgu09/SNasYOGHNvH7FXqOMGxMaTd0/m
         zfFpHST0CxEGs1uxP7N1TQO6U+P9lmmlXdP1IUuucjxWA6DgOog6NxPp0clf5cGmaaJD
         LAWIdnvEQA5Pym7GsZVS6tgW/saQxlGjVj5x9JEwTFwH+3wVMLMxaeVK/KNGm1WMD6kq
         xFGoiYMf5o6KZzAon4+C4rGglTvAyG80tTkpm/vBTWMu6zi9kro2KoKuhLjmiAsRn+BF
         /VCEhCxdQspNuiD2CDrFJwgX4Lj9A0/7wwWq4a/KQuYBSVpJOmwXuMKOl2dl10Lewa3X
         yCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Pch++DVEjAnWg+xt4kEu7hkcd3VsPliA8XsFfWS3u4E=;
        b=IrMJcsXguYZx3I7LDVaDXeHLa34zpTAsR5Lpw45JmJ3qOFmldMkA939nHoolMTd4FI
         SVSKVWhLG/PPQIvJv+Kh+TqpqVk+Ov5MKMVuhmnWSRxlbYdQ37nuxCvSOg5s1Aqsc4nC
         O05BrYMv74QwBhBM0TlzVFUmlt+3PZFTnItvdxQ5dDMnkiLv5QkI4PjGx6TAZtFXOQyp
         X8ZZrk7oooQNtLnXnSKEfuZetnTvsO7t2AMUP6mLhYmqqVeDa0qLbUfABhNVK6pi6N+9
         XyUftroyBBO13pJBGvHYRNb0ScDXMCDV5riJ1ODknHQw/nQYZ1D2aVKHZUmudH82W/VV
         GgTw==
X-Gm-Message-State: AOAM5310kmqofftuUS2q6sufAyFKCv+ATOrz5mj4+UECRLLenWyVVHzx
        gVHFNoi2SSgEhhgY4jfjKj18AA==
X-Google-Smtp-Source: ABdhPJwAx2Bev4ONYakSQQo212BVykUPU/0AphBThNhzYITS25wVGjv7nMvprYnW32Pe3fJdmuwIDQ==
X-Received: by 2002:a17:90a:1108:: with SMTP id d8mr16654639pja.190.1628777834935;
        Thu, 12 Aug 2021 07:17:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id t22sm3977702pgv.35.2021.08.12.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 07:17:14 -0700 (PDT)
Date:   Thu, 12 Aug 2021 07:17:14 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Aug 2021 07:17:12 PDT (-0700)
Subject:     Re: linux-next: Fixes tags needs some work in the risc-v-fixes tree
In-Reply-To: <20210812223006.642bb3a3@canb.auug.org.au>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, changbin.du@gmail.com,
        alex@ghiti.fr, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-c97dfa08-8901-4de6-b692-beab38b5802a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 12 Aug 2021 05:30:06 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   007666bcc606 ("riscv: Fix comment regarding kernel mapping overlapping with IS_ERR_VALUE")
>
> Fixes tag
>
>   Fixes: db6b84a368b4 ("riscv: Make sure the kernel mapping does not
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.
>
> In commit
>
>   589be135381f ("riscv: kexec: do not add '-mno-relax' flag if compiler doesn't support it")
>
> Fixes tag
>
>   Fixes: fba8a8674f ("RISC-V: Add kexec support")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks, these should be fixed.
