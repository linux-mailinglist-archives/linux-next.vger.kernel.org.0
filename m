Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D494134334D
	for <lists+linux-next@lfdr.de>; Sun, 21 Mar 2021 16:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCUP5l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 11:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhCUP5U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Mar 2021 11:57:20 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42AEC061574;
        Sun, 21 Mar 2021 08:57:19 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id x82so3891944ybg.5;
        Sun, 21 Mar 2021 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+sV6kItpzOoxa/owujtpfoPS6Krenk7d7kji7uHD8Y=;
        b=AXRiArA+N7m+lJjxGLBMGag2x8p+oyrSDX7REudDbmoVllmletHDCbk4133HxY8qZJ
         ni0/VEQJmwvO+yQ07o/0+GWCD+LN7ox4TtZPB+dYrisoLeBnCwiaB98XbMRq9Mn1aCJD
         tJJnj4dXKOOGtlja4ejiXofKWuMm1a9yiI+MkfyptEQWiT/risQ4MR5YEhardZVhaZuq
         hezCwtJiPqzklba5dRBUCldha+Xu7m4hUdJqJhSGB0fy8DsEw33eydU3Eq2g9gGqyrar
         qNBSZWFDNTu4wjp8sxvu8+txHE6a3tGMJEmVAiRsmCe4uftnxssaJp2Y4GomdhLClMg+
         mzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+sV6kItpzOoxa/owujtpfoPS6Krenk7d7kji7uHD8Y=;
        b=d0MjvSvuu+1yxIKJiuQqrz2btIbBjDHPGUIivl29Mnj5/7QGbRWuAt5UpjVrxT5emg
         b+NshiOElbqYPKyMqH/P5X6wjsEUcIEiQeEddvb6zqyHaPsnQms99YdH89s3ITcFrorH
         zbA0fCGLvYfnbYUI1He4JkPiVsQWjflS6mBX9yUFgIyt08PT6BLi5RKLZGmfSjt+t6hi
         aHTctx/8zIFYoKXe7pWnNakp8Gc3Mj/Nmi3POC7brznDBkSBKQbuM8g7yPyBRXt4Sehs
         LomwSGEvUAgL/VL5oQrML8VkQxuQ/xU0H6LPVXTXYSov+8eRhMRUjfljvS0GvGNuJ+HZ
         5fqQ==
X-Gm-Message-State: AOAM530+WfRdVGLKLfyyHTDtjP5uHNPRsB50YKtZwLsuQoSfm+L//B9I
        NQCsLB4hhNpQhBvPJvo2XYYZolBZ+kMP0FZStoU=
X-Google-Smtp-Source: ABdhPJyjl/4f2AJtPh85RzYT2TXLjMWtWrU4SJXWlj8nLA87oFLQk1DSylUheFSRhE8uSDJ7TOMSyYwVSW52DCNGxBo=
X-Received: by 2002:a25:3b55:: with SMTP id i82mr19904659yba.422.1616342238952;
 Sun, 21 Mar 2021 08:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210319175950.509fcbd0@canb.auug.org.au> <YFS1h6h+71sRlwFR@osiris>
 <20210320162734.1630cc55@elm.ozlabs.ibm.com> <CANiq72nKJBVsuvqr17qa0xnkQTUz9aaAGRi8SfXZAn-G=RYQXw@mail.gmail.com>
 <CANiq72n+-9vtpvvHTD=QzpskCbZEvTWhDXUaHrkwsJn4M3fjXg@mail.gmail.com>
 <CANiq72mp4=4FZ_Vq1pzA07vkJ1mKFKOFFhcVoH9zTJjLtrBc9A@mail.gmail.com> <8735woit8r.fsf@mpe.ellerman.id.au>
In-Reply-To: <8735woit8r.fsf@mpe.ellerman.id.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 21 Mar 2021 16:57:08 +0100
Message-ID: <CANiq72m986+NTBVAZLVaD=3dg_PVdNx5bV9Uo5hVmgbMtta9BQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 19
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Heiko Carstens <hca@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Mar 21, 2021 at 1:30 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Yes. But Monday in UTC+11 :)

Yeah :-) I'm on it.

Cheers,
Miguel
