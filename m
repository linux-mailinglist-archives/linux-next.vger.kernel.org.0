Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1C3CB206
	for <lists+linux-next@lfdr.de>; Fri, 16 Jul 2021 07:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbhGPFqo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Jul 2021 01:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbhGPFqn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Jul 2021 01:46:43 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C268DC06175F;
        Thu, 15 Jul 2021 22:43:48 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id z1so7284489ils.0;
        Thu, 15 Jul 2021 22:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CW4yklMYiN3MYwbxtAate8g1VenhP9jHa0RM5CBOGmY=;
        b=G9L6wLKBarCRnJS8fUfCFoYjqWD4hI3vIg3Lk0KvJWwuAyRcX5Yw3LKvwYL6XxC1yZ
         vGfSHDp4ZTR8Cb0RZn1NGUg11VbtWjwoSCyat3S2VJZUWE+DLnebCv22DTiQwW688xRk
         cVfR1VZw6C+63+UniglYTRnF0/FBlGhISvu4eBrWkC5RC7vzjhzfotQTaI08evQnIHQa
         a6WnHxa3Zr7Ouv8MAHqbC5tM5Q2Fu+w/KKmPngxu2URyquXBdmT4A5CLDz6UYiTzMJyn
         UYjX8O5Wd0aVU5tPoaqFyabAr7Swva+o6ECwZe610ghRonamj32IXrJZx4enxwWSv2GP
         i3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CW4yklMYiN3MYwbxtAate8g1VenhP9jHa0RM5CBOGmY=;
        b=AtQSlPdfbkbDyCj3u+Rqj74E6elEa6YH/BRjnv89an04kv9Wd2g7sIERPIEbwfypsW
         YfsWjtE0vEvVhIGinwbttmzuHg3I1yZKvnBev0uel+dwB/1r9QQfYxK+NvjhbipHCEdk
         5rUUN/8HlWzk1efaPhGvwO4cfaUpkDHYqCaucr8aTeTTa7OXK9sKO2PeS0LTN91HI1G0
         jITekzv7W5cnhejVAHZ7wzFgpasmohMfSqPbw5oOXso0+llNnGq5wqUYOcJ6cRwxZN6h
         dw+Bd5/GfecifeSDDwAKLTcDK+5fQfUdqrLzmAfNuMufYVK5mSNcr6fqPMJ6+tGKNpHu
         mQfQ==
X-Gm-Message-State: AOAM5302/j8cvSmcSsE89uZrQq0dyxKE3qMNbSgFdvHFh5exkS5JlZb8
        pm7a/Tg7KBKCpdfaD7ffm6erE4cGVr3IzFIM/2XW82wr7Dg=
X-Google-Smtp-Source: ABdhPJzJlImT7mV833N9Q2tGSVll7fGzbxQub3eO3Yp0d9N/M/CJ2RcLY6qNoapZAPAQBT9ondcM+utR4oUpENcymCs=
X-Received: by 2002:a05:6e02:dc4:: with SMTP id l4mr5580883ilj.94.1626414228251;
 Thu, 15 Jul 2021 22:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210716132958.51240693@canb.auug.org.au>
In-Reply-To: <20210716132958.51240693@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Jul 2021 07:43:37 +0200
Message-ID: <CANiq72=28hLd+nWZFZKU0e6C3RNjoU5ifOdNPwAFJU23neuM5w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the auxdisplay tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Lars Poeschel <poeschel@lemonage.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 16, 2021 at 5:30 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Probably not worth rebasing to fix, but can ve avoided in the future
> by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
> just making sure it is not set (or set to "auto").

Sorry, fixed!

Cheers,
Miguel
