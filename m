Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE314205475
	for <lists+linux-next@lfdr.de>; Tue, 23 Jun 2020 16:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732939AbgFWOYi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 10:24:38 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27439 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732792AbgFWOYg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 10:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592922275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RR1B9NfF9KKeLN7WfaVCil2nbXJzIf96KglwlOXnZyY=;
        b=HXpTGqyEDYq7uyLyatL3r00G4Bf8Vx5sEKLBdLN0pCcIw1QjigfAGrJqlimvLvYfI9vP+9
        ygPrJ8pbS0RGwpzlWZF4w9nSBnJ4pH0AI4E61sWNuRWR1wPYnmQksnEnSpBpg/RDR8PRyE
        FOXzyBAoEhGDc366F/weGVZotI5LACE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ZMuGYxTQNi62x5X4nhWRMA-1; Tue, 23 Jun 2020 10:24:33 -0400
X-MC-Unique: ZMuGYxTQNi62x5X4nhWRMA-1
Received: by mail-qk1-f198.google.com with SMTP id w14so15448942qkb.0
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2020 07:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RR1B9NfF9KKeLN7WfaVCil2nbXJzIf96KglwlOXnZyY=;
        b=BmR34clAYxO8oYkGSjpWhb6Q5Ac5JXG2q0HkPEC+bMRqhx3ZqS4vpFwFyXZI5udWLw
         W+Fb0+W/Nl8yv7yqbxwklKGr1MQm6W7kZw+HehfzTTquZl+6T3PjMoJDB7dQcj3P7ug/
         GJGV9mUb13zUqCbDOfAu2RAtcWGZkRt6xkk3LEGTvgDYyNSlZaYf4xM3Vj6EXGYToBuv
         oQxMYGVZgi8So6G3jCcXxU34bvIXdCBBPtzVFpVJr19C6wWL/imaoq1IcdoLPqvDE3fg
         7+opcSDmjJSWsuhLiRuskhtYNkXh2Yl7q3n7jQ5QAHyVckL933OpfdVhemhWhweSzCRp
         hYDA==
X-Gm-Message-State: AOAM53006IJhnSsBpo5kFPEVdmcR3pFgqaQiAwebP8G8ryi7uK/e84Gp
        nIMwhwSmxoJvCc5dPXvQt9aqTJMrmaqnLv3kPuc5bTjMi/PXC34t11uYn3BysI7Lwd7LTQ0Ps/O
        TnZ0n3NG7g/4neb15DUL3yiMmF135HpGE51DP0Q==
X-Received: by 2002:a37:27c2:: with SMTP id n185mr7033795qkn.459.1592922272562;
        Tue, 23 Jun 2020 07:24:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN9dNsQ1OTmPnyWwgxxe4CrufeTopFTwlk33LGRccCWckEmFGROVsT77uvggNbgbCLqsfatkBEIbv2KAIR71o=
X-Received: by 2002:a37:27c2:: with SMTP id n185mr7033772qkn.459.1592922272185;
 Tue, 23 Jun 2020 07:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200621140421.7f4552df@canb.auug.org.au> <20200623103736.25f67de5@canb.auug.org.au>
In-Reply-To: <20200623103736.25f67de5@canb.auug.org.au>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 23 Jun 2020 16:24:21 +0200
Message-ID: <CAO-hwJKX_bdgv=ZOx+KmSEZ1PkAzw-+NUPRBUOH_F8D+P4=XCw@mail.gmail.com>
Subject: Re: linux-next: build failures after merge of the hid tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Cristian Klein <cristian.klein@elastisys.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[adding Cristian, the author of the patch]


On Tue, Jun 23, 2020 at 2:37 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Sun, 21 Jun 2020 14:04:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> >
> > drivers/hid/intel-ish-hid/ipc/ipc.c:12:10: fatal error: client.h: No such file or directory
> >    12 | #include "client.h"
> >       |          ^~~~~~~~~~
> > drivers/hid/intel-ish-hid/ipc/pci-ish.c:22:10: fatal error: ishtp-dev.h: No such file or directory
> >    22 | #include "ishtp-dev.h"
> >       |          ^~~~~~~~~~~~~
> >
> > I don't know what caused it, but commit
> >
> >   470376737e88 ("HID: allow building hid.ko as an external module")

I am under the impression that this patch is causing the issue.

I am tempted to revert it (and force push the branch hid/for-5.9/core)
given that the 0-day bot also complained.

> >
> > did not fix it.  BTW, I build with "make O=...".
> >
> > I have used the hid tree from next-20200618 for today.
> >
> > BTW, the hid tree really needs cleaning up, it contains merge commits dating
> > back to April 2018 :-(

We are carefully not force pushing the hid/for-next branch, and all
the merges you are seeing there are the various merges we do after
including a patch that will be sent to linus later. Our for-next
branch never gets merged into for-linus, we handle that separately.

I always thought you prefer not having forced push on the for-next
branch. But if you rather us overwriting the tip of the branch at
every commit, we can do it for sure.

For reference, the way we handle branches are:
- master branch follows Linus' when there is an upstream merge of the
hid/for-linus branch
- every single commit goes into a branch named
for-<kernel_version>/<feature_name>
- those branches are created on top of current master and are never rebased
- every time we add a patch (series) on top of a feature branch, we
merge that into hid/for-next
- when we need to send a pull request to Linus, we merge the matching
"for-<kernel_version>/*" branches into hid/for-linus

This allows to keep a clear view of what is scheduled to be sent. But
the counterpart is that the hid/for-next branch never gets merged back
into hid/for-linus.

Cheers,
Benjamin

> >
> > $ git rev-list --count origin/master..hid/for-next
> > 301
> > $ git rev-list --no-merges --count origin/master..hid/for-next
> > 12
>
> I am still getting this failure.
>
> --
> Cheers,
> Stephen Rothwell

