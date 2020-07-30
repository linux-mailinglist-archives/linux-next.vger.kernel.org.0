Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9C22329D2
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 04:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgG3CNS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 22:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG3CNS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 22:13:18 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A133C0619D2
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 19:13:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r19so27144396ljn.12
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbyxg+vBVnUwNhF6wHPJRbrQKhEXP4EDZkqjL33ulC8=;
        b=bzgFXToNOzcaLAmgIt+T0m4TY8UlRWwL9ZmbMxXoi7Js+hwyr/1u527NYpJ0AzFfwp
         hR5A96iyL6BVxwjsCMm8WMG0KOXib7CoqXeQdc3Qq3gFRDaIBI1zPPUF4i1SRUCaa3+7
         C2+L1V+r5jNUWwAbW4hfwvrpdKEpd+3mzaOtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbyxg+vBVnUwNhF6wHPJRbrQKhEXP4EDZkqjL33ulC8=;
        b=h/odAeT4MRXV01yw9Qe1N8iOHxAUrCnlpwrhc+n6nqtvoHAOq7EygncMflJ3t7x6CA
         jZ29UKLMsWKb9A+I3bn2oXwVAcOwQsNA6+qpOdo/Zytri5XkNoxWLUFiIZRWo+hEKzyV
         giOhmA284Kpz1XDm5jbGr16laokI/SxRJkJolIvbQ9KVy5LA3ve3usFaEVgZd3gJIXIV
         posYHMiUpgkTA9ZN1VIB69AVYfKb1qAgiogtJy/dlClvM5Lpw/s6BW/rb7OT6XNf7y28
         CGGvfaHaaLtmIBOctzKVIUAgdcuubMWksnh7HH2bYcAY2dd/+O0+0qis0jo9hwZOYpgQ
         WdgQ==
X-Gm-Message-State: AOAM533CkMwFmHpMQ5m7QdXo5HyRENgVeGJPY+0olWxiTh53MWBmIkF1
        j6jyCrKzQXVgyewhr/KLrrhU1NImY7w=
X-Google-Smtp-Source: ABdhPJwnFmsDHac6ruHnYGxWlxfRGvI5+ueW1EBy2DWr39iihMec7nRuqnjv6kdEU3qfORlw6TIDMg==
X-Received: by 2002:a2e:880e:: with SMTP id x14mr330070ljh.218.1596075195891;
        Wed, 29 Jul 2020 19:13:15 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id r19sm838585lfi.58.2020.07.29.19.13.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 19:13:14 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id i80so14097681lfi.13
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 19:13:14 -0700 (PDT)
X-Received: by 2002:ac2:46d0:: with SMTP id p16mr223536lfo.142.1596075194006;
 Wed, 29 Jul 2020 19:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200730090828.2349e159@canb.auug.org.au> <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <CAHk-=whA7d4ug8-=TQWq_uR04+MqbfZemz+meFhfu_bCyGzvpw@mail.gmail.com>
In-Reply-To: <CAHk-=whA7d4ug8-=TQWq_uR04+MqbfZemz+meFhfu_bCyGzvpw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Jul 2020 19:12:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFLA=TeG903JHPvRHSoMd=mE=7EC0OMajs+bo014A4Lw@mail.gmail.com>
Message-ID: <CAHk-=wiFLA=TeG903JHPvRHSoMd=mE=7EC0OMajs+bo014A4Lw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 5:09 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Removing the __latent_entropy marker obviously fixes things.

Ok, I did that for now. I spent a few minutes looking at the gcc
plugin in case I'd be hit by some sudden stroke of genius, but that
didn't happen, so let's avoid the issue until somebody who knows the
gcc plugins better can come up with what the right solution is.

            Linus
