Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7860E191D33
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 00:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgCXXDJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 19:03:09 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34684 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbgCXXDI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Mar 2020 19:03:08 -0400
Received: by mail-pj1-f68.google.com with SMTP id q16so1661353pje.1
        for <linux-next@vger.kernel.org>; Tue, 24 Mar 2020 16:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=caaFIIIt12v7NnlB+JkGTlJxk5XtTgNBQOzAZR3YtSU=;
        b=szxby5DmXpqS2cBekkiZsvcCmCXeaAF3Vt1Ci/bIc8LIL3LmWxxBGDEEyNG7SvgW9k
         b07YoAQSbl4hm+NGBDXyN+MHCBfJ8g8fsNpXho4mc1TsLIgRfqz64Lv0/TvTLmcxMG9w
         4jsjIVjBO3PA77m+5p7mmfZdruFbAhjgrIa6nrqkFzq/CZpoTDibQ35VBuKyRroZrEmI
         64qWtvuYxFUtIfCe5W6rS7vPIRBYcQcUIueAA8CIjoqtx72gzFrrPewOYHFkALw5yD68
         HNCQ862wFqKn5e47N9uZ6LMJBe7Rqvim4M6KqfBkdkRA9vHcKzVhya7D6mFZV2p4x0qB
         oDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=caaFIIIt12v7NnlB+JkGTlJxk5XtTgNBQOzAZR3YtSU=;
        b=T3lkoW3IqNEyOcza5GxJsQPTsMo7vwXzZ1s/i7yoci6LUd5KI6RUtsCAaFCOgWXBqT
         bOW91PqfJlhy33qDaUZRN65RMWKaETKKkkFWxBb8Ta9Sqk2PlSwyyVzEQIJGkkpFyLKC
         9wGYk6BTsa6wMaulVETi8xPJ0RxAdYU6461MkztQzsReUec4cr5W5Qq8Mg40M8GIaW1a
         2J1s+zl4cANbrnk4gKXCQQ3Og9fg9/oPIFZgMUmW7Prq6MZK8dnDXfgdHFBfchUe/VTA
         3h0OPEzA9eIbRzLvzyq9+5sU+PtNP2ODxYuzENulo3Ozj8+jfQyki2Y7ndTWuBO+V9RU
         GwKw==
X-Gm-Message-State: ANhLgQ2lME9dlMa5Y+qyO7RibqnnLBiJSNRJVFcI2goftxsR1UFhC+B/
        P2H0X1fXINFHHcCUZRlKSrAxOIVe7G0jfMZ1k6jv4w==
X-Google-Smtp-Source: ADFU+vsfQx6nUivjTgQwIwIh+hXPldHTU+juUFoemo8hpe3IRczTIEA4HW8lw9yLuIXUwcQ0Rj6/koQcrCN9PdBvHM0=
X-Received: by 2002:a17:90a:5218:: with SMTP id v24mr282003pjh.90.1585090987319;
 Tue, 24 Mar 2020 16:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200320201539.3a3a8640@canb.auug.org.au> <ca0078e2-89b5-09a7-f61e-7f2906900622@infradead.org>
 <20200324164709.ux4riz7v7uy32nlj@treble> <39035493-9d5b-9da3-10d4-0af5d1cdb32a@infradead.org>
 <20200324211303.GQ2452@worktop.programming.kicks-ass.net>
In-Reply-To: <20200324211303.GQ2452@worktop.programming.kicks-ass.net>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 25 Mar 2020 00:02:55 +0100
Message-ID: <CAAeHK+xS-EGjoz0467cXW6P5MQW0+s65gAh96tqZThxyZiJZrg@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 20 (objtool warnings)
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 24, 2020 at 10:13 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Mar 24, 2020 at 10:53:05AM -0700, Randy Dunlap wrote:
> > >> kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x89: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
> > >>
> >
> > config-r1510 is attached.
> > and kcov.o is attached.
>
> I'm thinking this is because of commit:
>
>   0d6958a70483 kcov: collect coverage from interrupts
>
> Which has:
>
> @@ -1230,6 +1230,9 @@ struct task_struct {
>
> +       bool                            kcov_softirq;
>
> @@ -145,9 +157,10 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
>
> +       if (!in_task() && !(in_serving_softirq() && t->kcov_softirq))
>
> And this __ubsan_handle_load_invalid_value() is verifying a bool is 0,1.
>
> Another reason to hate on _Bool I suppose...
>
> Let me see what to do about that... :/

Hm, let's turn it into an unsigned int if bool causes a problem? I can
send a patch.
