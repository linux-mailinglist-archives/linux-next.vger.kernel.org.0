Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA19C2AF77E
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 18:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgKKRoB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 12:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgKKRoA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 12:44:00 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D135C0613D1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 09:43:58 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id g11so1324347pll.13
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 09:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tsu1wgRN/XwGLZIcqUwi0BvJaexsFk3P467mtRcVH+w=;
        b=l0aza8swvNOkP3/BQF1fjPWdXJ8NDZ6neGb/HBDhbCEv7IxFwebR+0GV3b01VjOOoh
         +EhA4UCd3guChQSOUmVdE4IhbLrZbhfl2loC6k0L6Mb+pn+X6JYoJIuo7giccGyRvknW
         lvgmNorVek0WmHzB8Cq6cOZRmYZTpLJRx9u+eQkYwy9alXp5Wxf7z6aLPKkU7JE9AKty
         +SwUYQnAfAVHg+ilizoNDvKr5T3TsC/p69GcUU+nPIINoAOsqb4u96xdnngvNzU6nsuG
         f95hD+JN3q7c9XkOq/JSc7mgYguAu1iQx6H/eJ+Ps1PZV/8W5ZUIlifeKkIukHg+9o+6
         6BTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tsu1wgRN/XwGLZIcqUwi0BvJaexsFk3P467mtRcVH+w=;
        b=JVVPRJuDhr9UtFyWyhiejP9yrAADoCTrUFdZd2ke/JNE6yhintoH7DtB92daFIXOxZ
         soDxuCYpaleVnXJB+JQ+fn1lhYuj8curgKFC9IvO2adatt3n/wR2BwziUmwkb2NWkzlF
         HmfWF6NHRAiJUL88hFGpIgicopfCQXur12/VCONqliNHeQiX3mgejYGY81yE9z8RTLDS
         BsChTCU8MiQVphC0cfDFfnfAzg6JtjEaJQH63OM/crRWwEmNS2YjMiMyN3GNqGMR97B4
         e4LRLRdjZgulcV6A7jFFqA+vJ0PSKQknoxOn0b+2Pe/4N27XpWZa9Ec0g+jDE061iHR4
         h2ig==
X-Gm-Message-State: AOAM531dYZZiXD8G7OiJK84G47wo7zFfa/cYOKN4aMYp+zUEjLlyUiZF
        hBiXwcA38ct9R5Cwti/sYCLAoPixGueJKs/ZCQ/Pzw==
X-Google-Smtp-Source: ABdhPJzO1ttJvAzBSg/S2s27I/7TEhnJ1LpjynWSVH/0ZPre4UGMid8v2eZv1EVmiuPhDDZTp5wz9Rg0ACvrOd8M1D0=
X-Received: by 2002:a17:90b:3111:: with SMTP id gc17mr4869942pjb.41.1605116637429;
 Wed, 11 Nov 2020 09:43:57 -0800 (PST)
MIME-Version: 1.0
References: <000000000000fe575905b3cff92c@google.com> <bf31020f4e50b303fd0dd3dfda0e50de79ed25db.camel@redhat.com>
In-Reply-To: <bf31020f4e50b303fd0dd3dfda0e50de79ed25db.camel@redhat.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 11 Nov 2020 18:43:46 +0100
Message-ID: <CAAeHK+yLgDYOS35sWT8=4_d-gZKU_B10D9ZEBPZDC1P6MO2D6Q@mail.gmail.com>
Subject: Re: linux-next boot error: BUG: unable to handle kernel NULL pointer
 dereference in mempool_init_node
To:     Qian Cai <cai@redhat.com>
Cc:     syzbot <syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 11, 2020 at 5:26 PM Qian Cai <cai@redhat.com> wrote:
>
> It looks to me the code paths below had recently been modified heavily by this
> patchset. If this is reproducible, it can be confirmed by reverting it.
>
> https://lore.kernel.org/linux-arm-kernel/cover.1605046662.git.andreyknvl@google.com/

I'll try to reproduce this and figure out the issue. Thanks for letting us know!
