Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1435A421A04
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 00:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235374AbhJDWbI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 18:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235083AbhJDWbH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 18:31:07 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA61C061749
        for <linux-next@vger.kernel.org>; Mon,  4 Oct 2021 15:29:17 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id i30so801560vsj.13
        for <linux-next@vger.kernel.org>; Mon, 04 Oct 2021 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=qPpOKzL1TojkFo7Tn+DkovguIN33cj/XmXhWx++uBk0=;
        b=fHt7+vxrTsuWelPcJjGyCr3kU69Kbp5HLvJvuNH1BJOsOKFF7SZfcl/mzJY4YPnEFV
         XA2+3jbAdxD+XdLC+uY1YDc74Z/elfYItiZBcrgaA682l/avtQ+MifVbouLe43UpujX1
         qxRIENz/m8oKrq4oFjUm3tT6cPM+llJYybdP4ljFBHiVm7n5i1A8aLCeHv6u9Cl+FMcx
         4Ni9KUCLxj0wzARsU8Fs5Csg549yM2utQp6LEKyfU/hk0ExpYmnGsPt0iWDwtOdwEKC+
         qOr63/K0NX5Uu4BabUj17pFMR2HAcdGFBXi5yMBChNy2/sEra+ZriBJp/jFnTuYPN/LF
         fW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=qPpOKzL1TojkFo7Tn+DkovguIN33cj/XmXhWx++uBk0=;
        b=KkbI0WwLRpo3RViU+D7ZBYhe0Th63+3Wf8StPVa8yEwmFAD/JqLqs9AvceKPReGTuf
         eJ1UcyfBjKxlBS/dUOvhf8XHnWHMVzLLkjU6ji2pwEC9hYS+oBogeb86t0UkOumv1+n8
         cMVloVdbukotP8aRB9mEo43VqBst1ty0xCXVN0B8wf2egotzYmQG+gzVXbl7WVCqv7kw
         nVbtXDTufKwSyQLHe4L0hT5B7xFwT0dxFrL8xOuWkE0dUkFqw1DSTAEJGCupiJsphP6q
         /0VpgbdllUk7WDq601z9t7Kccf+d5vM8QrPLH7z21d5ivtm3+s0TTKtSxGH+A6fRKWp/
         VGaQ==
X-Gm-Message-State: AOAM531bWxVXCnIutZyh7nN5GQe0ch7lhVL//u4JhafvJ4+/o6IJxqWX
        7OwbNR5oPUZaOqAEq4o1eQuCwg==
X-Google-Smtp-Source: ABdhPJyglSk64R+xeEROwSK0mJ5EbpmYhYCj7KnifLQjY0Pq173UmZYvJY0mEVYAHuI9z6b4hWJy8Q==
X-Received: by 2002:a67:e24f:: with SMTP id w15mr15742805vse.36.1633386557047;
        Mon, 04 Oct 2021 15:29:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id a14sm7917897uak.8.2021.10.04.15.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 15:29:16 -0700 (PDT)
Date:   Mon, 04 Oct 2021 15:29:16 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 15:29:12 PDT (-0700)
Subject:     Re: linux-next: Signed-off-by missing for commit in the risc-v tree
In-Reply-To: <20211005080926.2f624ea7@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-71823752-6ddd-4d08-8b18-a6924721e072@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 04 Oct 2021 14:09:26 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   3042b3659ac5 ("riscv/vdso: Add support for time namespaces")
>
> is missing a Signed-off-by from its committer.

Sorry about that, it's fixed.
