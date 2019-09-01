Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00B81A4C65
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 23:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfIAVyn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 17:54:43 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43695 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbfIAVyn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 1 Sep 2019 17:54:43 -0400
Received: by mail-qt1-f196.google.com with SMTP id l22so1499207qtp.10;
        Sun, 01 Sep 2019 14:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yoa9z48eCwymrwFIpuIwZA+XOPr3C5xOvId1XpBfXw0=;
        b=he58hn93nLDLV2+w3quqMZh8uwidt9lfoFhXlgYK+UbYX20D7qV6g4aWy9kpbGIvUM
         ZFlXwGtWLvxIXZrl3SpYcVaUTywTV2HUsGT42ve3SpGqNF6cVI/5oq9WSb89Qr9GpSv3
         XMm8CQgJpj5JgphEv5LPtORPQD9LDHeax2j1jB+veckE+j39qJikIS98TnyxWb4AQq7H
         pd6k2tdzt4rwtDh4D5jg04CgMXAv1gubYzp3KAYo55LGrf3h0o42JNk4AdX3l0oM+xxc
         LZgWEUyrEhOY7t1lL6IZAeZoVu9x1Io94cU1R3CMftdgPcknmNWx2kOS9hSU65giTW09
         FJbQ==
X-Gm-Message-State: APjAAAXRwccJ/qn3R/JJVU6J24apNNtWUsb17qzaXlwKMMLZBARcLsQ0
        /QyO4bN6wiBTEldAJ8LKFuHeSpK6vP3gEePH6SYEQg==
X-Google-Smtp-Source: APXvYqyKOLx7UfOosw3gNC35cwPOvzEjcNmk7PyMQtMFOxAFOzHDnzrsfJyIypvmxEOYW0qmZR/0n86RMBXj9LhTJ8k=
X-Received: by 2002:aed:2842:: with SMTP id r60mr16334981qtd.142.1567374881894;
 Sun, 01 Sep 2019 14:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190902071848.6cc2ca04@canb.auug.org.au>
In-Reply-To: <20190902071848.6cc2ca04@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 1 Sep 2019 23:54:25 +0200
Message-ID: <CAK8P3a2hiR5pFyPqK5QHuS_oRLJRyiY9drFsGjFWbq56w7fCqw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the asm-generic tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Sep 1, 2019 at 11:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   adea510eaf35 ("__div64_const32(): improve the generic C version")
>
> is missing a Signed-off-by from its committer.

Fixed, thanks for pointing it out!

      Arnd
