Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F69694745
	for <lists+linux-next@lfdr.de>; Mon, 13 Feb 2023 14:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjBMNni (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Feb 2023 08:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjBMNni (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2023 08:43:38 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05375901C
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 05:43:35 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-52bfa3dfd95so163115647b3.9
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 05:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MZUqtHGEt4hmalJ9Nq9va1qwBby7HH+VJC/DscVKwTk=;
        b=LK7EpQgWthIGYI8KqTlaFjM4JtMGQPQP3rRAsKf2tSoinZX2ZSFX61iXyZk41qkMWS
         kA3LmtdC/QUE+jBbJDbDsKYqu0wyXxxUBszrMiEbhBWDC0IXszDkEVDxBcFQGLkOoiDH
         4p5K6Sc0ltdB+x5aujxz6MIKhSAR2j/8+4GqtglaObnUhqZiheS94HhpGZ8z/RWLQpQl
         3dKqkWn8Vz/5Tn08WhJ+/HHsPABDlfVflPq9v++44IgoLpOCHEM/Ayxo+qsn8fZysGju
         1H3rguff9gEYCxDrd1xtfXJRbpdyHPqVHe6m2ZOS0FsQV0b7m2gd9nCu5cfT9C0zakJO
         CTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZUqtHGEt4hmalJ9Nq9va1qwBby7HH+VJC/DscVKwTk=;
        b=JmVsCw0jzesKf0OfA4trcz3p9PqG2XOz4UU2znbjNfXMK/yV6YRkja2OHneZBIMIU7
         dR/yMTJabnZsKjSwAbNZ0dJuioCa4raRW71JXd+aOurkH0VOiBYz4VnH2lW0kPO20noG
         X6JBfNzid6onNggbpSmLYRpIuMC+1PL81M8j3a6UL07YSnDCM8fQKm/RxkwHaM5VTAup
         6x6K9eAsp/HtnD1frsco0unqkdhdmB1Q6jqs+Jk7p+59aB5PzutaEmSVAcHADkI5VbMF
         tCWDt6MLk9zfuLDzmzM/685p5I84aqo7m4p9AYFaK0uVzR7DXp1cadr0SnmedAUShULC
         VasQ==
X-Gm-Message-State: AO0yUKXm7012dAOqQl+mlVlCltJISjz+AR2ekH5Iy2FnLyp0hP8tZh8q
        OvpkH4tUh4mrabe8FTouHZfd52izY7km6Ne6fMJtFZbsJQytHw==
X-Google-Smtp-Source: AK7set/lXYFWvBmM87O7a1KxrqBS3XjQWpO/aWMK5QeiALscA5wifZwrCEL1qcsuhU6qka+WxebN4apgDBUgbelovlo=
X-Received: by 2002:a0d:db96:0:b0:52e:c7a1:7439 with SMTP id
 d144-20020a0ddb96000000b0052ec7a17439mr1272721ywe.384.1676295814296; Mon, 13
 Feb 2023 05:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20230213080620.62f7eeb6@canb.auug.org.au> <Y+oZ7O9d8r8SIM0A@smile.fi.intel.com>
In-Reply-To: <Y+oZ7O9d8r8SIM0A@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Feb 2023 14:43:22 +0100
Message-ID: <CACRpkdYrBpUZAcJMvXMouW08RW+6LYzPraeJdDFv+yQRzoqWrA@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the pinctrl-intel-fixes tree
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 13, 2023 at 12:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Feb 13, 2023 at 08:06:20AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > The following commit is also in Linus Torvalds' tree as a different commit
> > (but the same patch):
> >
> >   a13bbd841bf8 ("pinctrl: intel: Restore the pins that used to be in Direct IRQ mode")
> >
> > This is commit
> >
> >   a8520be3ffef ("pinctrl: intel: Restore the pins that used to be in Direct IRQ mode")
> >
> > in Linus' tree.
>
> I believe this due to it's in my tree and not tagged. That's why it appeared in
> the upper trees with different SHA. I'll drop mine.

Ah, also the $subject says "intel pinctrl fixes" tree, not the
"pinctrl fixes" :P

My attention to detail is lacking today, like all days...

Yours,
Linus Walleij
