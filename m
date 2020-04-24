Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07511B7D9F
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 20:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgDXSMh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 14:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727059AbgDXSMg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 14:12:36 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B4BC09B04A
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 11:12:36 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id l78so11112058qke.7
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=605Xbs+AiEmxOBeIcLfW5J6eNXAc0Z5gnHisrr+d4y8=;
        b=PoZ6lCGn6LiX6Qvdv+7FE4MluvpJF+HdqsJGJVmXFqAgR8ibPXRqIT1861LhrLQ/f+
         RcgP4j3AFtvZInNCejsho15AEpTM+Qu+C+D2XfyERk9LaW2ci2hte2Asq7pqMbtY9xlP
         lE211DfGMhvzVgbdYOKKnATXTFL5RJdkpQOzaPVn5KkXECXM1fa9nC2j6foDnxuRIaUr
         N9fmGM0jD2GAEudg32qMP4WjYcVjqI58hVYHxOsfLa/uYQ9x2go4Gd00EKM/4e6yeXF7
         po4R9v9ZByAUD471FcGwqfLsXvGl4z1E5VsncqNcZrGWeXU+r4AgnwygbSxO3g4B19lJ
         62lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=605Xbs+AiEmxOBeIcLfW5J6eNXAc0Z5gnHisrr+d4y8=;
        b=Ntp+dFNnVzPu0A7zvITrMnj2UKmTBvR5DuE+qYpPiAMSGZHatzOwmoiFBvFQMfxfH9
         6JLNQpot0EjhXhI9aiy9hrx7+947/0gDa4gMP7DTFwL30N/BkmvZ8BfAAj8YNc3OpDsP
         IdgfpJCIHGV9gwmn13aukG6tOThUF2+VKQLrJuNrf9MJCI41MUUGXeLp5F+SZLrhhu3W
         F7zlpxYlE1otKSdzYA83BjFIOeBWk4nGrucIoX7F4Zr6ronZ44xF2MgrA4ijdZ/tmMVa
         vUOinWOZwTNrpr1YUBSl7EfMw3xfyO9KHAUbqgxe3dO9xnfe5v4VEHf5uWwZjH+RkiSM
         VLEA==
X-Gm-Message-State: AGi0Puad502vGZSJkPQybWdTxfy6TWgEZ5fNEMULUNZ+fdGVx5lmIArZ
        rGdXPwGtRJSm9CcdJv8GJRymBPg0xeOYnfTXX7W1XaCN
X-Google-Smtp-Source: APiQypJ7jX6v4faCbJq6LaiZYV0y3khBI2i8+c6ld2Tla/w03R+TMANq3dhbmOA8LbECC3Cq5F02TcLexA9I9wc/TCY=
X-Received: by 2002:a05:620a:166d:: with SMTP id d13mr9476035qko.448.1587751955516;
 Fri, 24 Apr 2020 11:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200424174805.28b8d463@canb.auug.org.au> <f11ce3ab-9ede-6241-d648-1a2b34e1ea4b@infradead.org>
 <CAEf4BzaEjNKU0rV-im2aU1j0xrdYZhC61OLnu31iWy8G4S+yew@mail.gmail.com>
In-Reply-To: <CAEf4BzaEjNKU0rV-im2aU1j0xrdYZhC61OLnu31iWy8G4S+yew@mail.gmail.com>
From:   Stanislav Fomichev <sdf@google.com>
Date:   Fri, 24 Apr 2020 11:12:23 -0700
Message-ID: <CAKH8qBsBvKHswiX1nx40LgO+BGeTmb1NX8tiTttt_0uu6T3dCA@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 24 (kernel/bpf/cgroup.c)
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 24, 2020 at 11:07 AM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Apr 24, 2020 at 8:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 4/24/20 12:48 AM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20200423:
> > >
> >
> > on i386:
> >
> > ld: kernel/bpf/cgroup.o: in function `cgroup_base_func_proto.isra.11':
> > cgroup.c:(.text+0x14a1): undefined reference to `bpf_event_output_data_proto'
> > ld: cgroup.c:(.text+0x14c1): undefined reference to `bpf_base_func_proto'
> >
>
> Stanislav, could you please take a look?
Sure, looking ...
