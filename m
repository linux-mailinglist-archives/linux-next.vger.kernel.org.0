Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5018113849
	for <lists+linux-next@lfdr.de>; Thu,  5 Dec 2019 00:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfLDXgU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Dec 2019 18:36:20 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32879 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbfLDXgU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Dec 2019 18:36:20 -0500
Received: by mail-lj1-f194.google.com with SMTP id 21so1341655ljr.0
        for <linux-next@vger.kernel.org>; Wed, 04 Dec 2019 15:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=siad11pyKMHN/ABbhrW0Mm1V+zj9RUyniY+RuR4S5Cg=;
        b=dsT0KNTcZjZq37qCkdG8G8XUtiZJ1U/V64DuhRwUynGLCIDQY2DO9xqdhes4l2QNcD
         zUMXoBxJMvc/job/mK2PhE1k6VVsuDTiu8z3ommkP0dXx/JSZHmsq9dY1t8Hqg+cRhxX
         KuVNKZgOiVFXEiO8gzTqJG3em55r2IyiZyEX7gvaQdbVK/YbskQcysj3tF1b2O8t0/ul
         2/BX3EYVmF9GDOMpo+1yVbqBtm9YtJPLl9sQqugN2loWlNj2kD+TivW05ei60IaP23rj
         HikyRsn8YnD7/XQMPUVWJuDAoGzmbZ0wIaIQxduRkVm42CDcQGm6FxJptDBk3blLcOaX
         V92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=siad11pyKMHN/ABbhrW0Mm1V+zj9RUyniY+RuR4S5Cg=;
        b=WzjZzfRsBWDQ2FAHO3BTeb7G3fzqFCj+YEkXNrXe85TwU8bSESz/PUcK6Hlz2iMNgG
         WK4+rPiPb+Y9xmqkxVtNMsWOjbQBMw9+vf+zrqFZTCBId8FrprkshYGSPSUj9oP/ITzo
         qQ6da2P3DUU6/V1sjBXZapbXvzYXxyWdL0CBs4j5YgzyBs72jb+9G29EIrcL0c7hZGka
         NUVavlKZN/bJShRlV9mwHu6JRqMsgV9Z9BGuoBZiOFmy+8WQ7gCSBYiXC+3p/aYpIuOx
         oIkIUEjzrDR7VXx/+iTUuce9WnlDLLJCpY/AAt4ITvvWe07HgmW2hUoSZn9g75/dDUz/
         uzaA==
X-Gm-Message-State: APjAAAVjuJFHN5GG6y5Bn2bda3o30CsR44D4BzHiDMq0l8BEBIMVtxyb
        X5bqvOuSPaCEO8b2wpYa0oKU0ZPferDrelxHLwo5IA==
X-Google-Smtp-Source: APXvYqzJbFVzxD/hiEZAHCZIDwC/OWPE3gPtN3+jvcFCQfBmovI5uxd24DNWum0sE+nPjtG076fplETO6279Qumk+5Q=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr3647014ljm.218.1575502578128;
 Wed, 04 Dec 2019 15:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20191203155405.31404722@canb.auug.org.au> <1a78124d-bef9-46da-aef4-60f85fddfceb@infradead.org>
 <1c54235b-545c-db3e-4225-ec6824ac6003@linux.intel.com>
In-Reply-To: <1c54235b-545c-db3e-4225-ec6824ac6003@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Dec 2019 00:36:06 +0100
Message-ID: <CACRpkdaNuQpaMe+FsQ6UeHMwP8f=1uCvG+kanhFauMRn_CrSCA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 3 (pinctrl-equilibrium)
To:     "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 4, 2019 at 10:36 AM Tanwar, Rahul
<rahul.tanwar@linux.intel.com> wrote:

> I have a patch that adds 'depends on OF' in the Kconfig to resolve this but i
> want to ensure that i recreate this error first & confirm resolution with the
> patch before posting it. Thanks.

That's gonna be a good patch anyway, so just send it :)
We should always depend on OF when we need it.

Yours,
Linus Walleij
