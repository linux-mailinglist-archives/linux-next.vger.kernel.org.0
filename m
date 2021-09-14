Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B7440A1D1
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 02:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhINAVE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 20:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhINAVD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2021 20:21:03 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582FEC061574
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 17:19:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id p15so20402495ljn.3
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 17:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJCOVeO589IX0eZ2k9PI4XmEqC+ha+gDBXVAR0aVS3A=;
        b=SclZiWrkT5KucTv1KidhHP6yMCpKWMNqoOiS1UgRHORAfJuSSMf+xaeagNjetAELs6
         Bh2TOhuIaWLPnM+/W2Yzq/TD4x6e1lZqhBUlLoChPi52C7bRjop+4ZM3lAIpZzJOEVn9
         lcHuoBjFShp/uD8fDDM5+JSs5YrWYKB9IWsGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OJCOVeO589IX0eZ2k9PI4XmEqC+ha+gDBXVAR0aVS3A=;
        b=oJ2pv1An8pu/ogc3oj174f+1xCE1EDsgVrtYVFROr4k/oXQZ+GdrFE0EeUod4rLril
         mfiZkIChV/dEBP1pRFgbKCwjVyyYzGX2CBXeRp/Ljrvg1VwSB+WcyeMX1796ib2ojcFJ
         ZWKIJz3syNzKNjY91UeKaxF+ztDIi16dN+t46X0OZLubA3+NDScG6SfySQGX35PguRYe
         lonOYFv7EUWeAXu6vLaYAk5WNo1522VB1L+Cfvy3dlZEzYVSg1SfZ6TjasYD4dSHNc0Q
         zgpoA6fhSr/JGCveGJH0h9Q4/7dqCnLtnrZHdWERTYhv/rRp+a/UTo3BKVEwiT+vEQf8
         qYWQ==
X-Gm-Message-State: AOAM530Z2+o5ckvXIdmxI5h2otVk6ol4pYmw7KpuHb5dMuvODlcH0u8w
        LJr9XwTawGjPkkk7UPyZFyfqOWi9lMnKiVw1iNg=
X-Google-Smtp-Source: ABdhPJzOdWUl9fzhvvnMBjzNt0ERYdTEugkcPNfVpiTosvdwn5RrGngUelU0Ln6Rkjj3p7I960dKzg==
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr12674272ljo.288.1631578785461;
        Mon, 13 Sep 2021 17:19:45 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id h15sm1142752ljc.96.2021.09.13.17.19.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 17:19:45 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id w4so20348652ljh.13
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 17:19:44 -0700 (PDT)
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr12192430ljm.95.1631578784223;
 Mon, 13 Sep 2021 17:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au>
In-Reply-To: <20210914100853.3f502bc9@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Sep 2021 17:19:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
Message-ID: <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 13, 2021 at 5:09 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>   gcc -Wp,-MD,arch/powerpc/boot/.crt0.o.d

Ok, so it's not the funky "clang reports gcc-4" that caused tool breakage.

What version of gcc is this? Are you maybe on gcc-4.9 and we just
didn't check that properly?

              Linus
