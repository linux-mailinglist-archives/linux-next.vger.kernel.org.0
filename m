Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F98A2A6C
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfH2W6Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:58:16 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33596 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2W6Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 18:58:16 -0400
Received: by mail-lf1-f67.google.com with SMTP id g9so3845550lfb.0;
        Thu, 29 Aug 2019 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jMpEpYdKjxQTMTwoqFDRd4GHoam1TKxyfcWSTCd8Tl4=;
        b=Egy9LB6DaC3zxQqnylGk3rji2dvWp76VLEoV+WIXgsnS5Q7qz7iRTsnXSEnTEXRvzO
         Oi6RNY7IBhjMzwJ1Zd5tbKBwIFqrpuuk64I7zdVifFHDMaxBYUZQldtmqnfwsCMqIDBH
         AJcZIpMSx+xQZfu8w+MdeOTrMU2kcVrdTQRwwmsyHAYf14Szldqp+1zSwul0aIMF2RMS
         h8WvKJ02Osc4h6cyxwl+izBZcwLLRIKYMldwtLsY3gNSKwjWLYb4orKuR0SMw5o/5BdV
         T939dtM2YjkP0MnRiPICH0GY5k9JNqw7B7k9DqrU9Bp03Viferu3+hQsaFitNQ4+Bzm+
         k5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jMpEpYdKjxQTMTwoqFDRd4GHoam1TKxyfcWSTCd8Tl4=;
        b=miMUsvUUb48/bV2ZvBR7MM54AeT/qokL+yurhJwCfS2tstBhskD2cyTETzJXJbGo9k
         tIReGzMB0Dm3D81YfsiBe5kWeD4dA/TIwUyxyIGFa0xwG7Y2DG92jQf/ID9TVsxD7Sy3
         uQTeQgwPvG7V0LSv8J4mg4GGhUjrhjzJwov6sd3ABfRGfvNvhVoOGu+ffeSes/pCkyCL
         BTMux5wI2lAwFgn+0onBoxvvuZ0Y+tQg82RpsuQJqwUU4NSMfamUjO2hClls71NX+B5X
         t34y4zG6ulyyajgfAISBT9FqDMe6Ms8rydb1WI1jrlCaxTTLCT2Jf3B1k+2YKJ8LWOFN
         nqDg==
X-Gm-Message-State: APjAAAXkQxeHqkLGJVaApiOWOGNrU4zYd3Es/lmSHWgWLdTLF42gxq0P
        q36AmWVYPnLgzUg/ZxBYu+siOOaxOiURnaw/K3s=
X-Google-Smtp-Source: APXvYqxVL/7P09rPYGqWIu+8vgNxEGPIbIlZmnnUZavyaCiYA+JtMtfdTBE8f9LO2d1phLWjDhHel7o7xCP2v4QFphE=
X-Received: by 2002:ac2:4901:: with SMTP id n1mr7812539lfi.0.1567119494587;
 Thu, 29 Aug 2019 15:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190830085227.01676c93@canb.auug.org.au> <CANiq72mGhn0q=hEJMQ=E7HoMrOEhW=Mgvgtc=mqRCo_twUHD_w@mail.gmail.com>
In-Reply-To: <CANiq72mGhn0q=hEJMQ=E7HoMrOEhW=Mgvgtc=mqRCo_twUHD_w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 30 Aug 2019 00:58:03 +0200
Message-ID: <CANiq72m4QV+ojs-jyxX39+M-Jjr_B47_hgzuwo5dnQXsq2tyxA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the compiler-attributes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 30, 2019 at 12:54 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, we just saw it, I was about to drop it from the queue. It is
> indeed because we don't have those __* defines within the compilation
> environment of the kernel.

Dropped!

Cheers,
Miguel
