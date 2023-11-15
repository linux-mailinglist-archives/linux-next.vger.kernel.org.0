Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA8A7ED714
	for <lists+linux-next@lfdr.de>; Wed, 15 Nov 2023 23:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343654AbjKOWSX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Nov 2023 17:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235581AbjKOWSW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2023 17:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CB01A5
        for <linux-next@vger.kernel.org>; Wed, 15 Nov 2023 14:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700086698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A0/rh1GWMWqNOAuzi+E/D5JJGdyRKtEN1IIz+9EJyJc=;
        b=cX4N4tpD053mtMhWD4SbdgdIY//gyI6pEdZqxBx0VGEFc1vpk9r9NY74T7PGCdwWdGejtr
        etgis2Q5CpLcgbnJ8AWw0kM59LEyomknAX0WhyxPzLVl+JSzrzIcf/XZI+R4V8OP+KQTGy
        R6CLtJG0LjVKZkfqdmnfRITfVe9VETo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-EH1a9JeBOqecNrR4K1_fcw-1; Wed, 15 Nov 2023 17:18:17 -0500
X-MC-Unique: EH1a9JeBOqecNrR4K1_fcw-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc5ef7e815so2120375ad.3
        for <linux-next@vger.kernel.org>; Wed, 15 Nov 2023 14:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700086696; x=1700691496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0/rh1GWMWqNOAuzi+E/D5JJGdyRKtEN1IIz+9EJyJc=;
        b=IxYJe5Jx380XAANCmos++v5kqi8cGbZDoofg/372VcHeecD5yuRS22ZKG9W9R1j5kL
         m/eMXNVbZxwqCOarLgd5dpLxsDEP1lfLQ/B9PYDgprqakVZSQfzGNao9UKjEgUFjvkKu
         PJbpOzn1DPURXxNQspWauONI55Q66w2cfNBhYEhy3ErnFqA31hHq3DudUH3lb6+lYmPG
         GTw44vK97oT2y78ugrKxof2M0e9jbKCqAS135srQuODObTnI8cl/RwqzTzSzXfc1xMFy
         AKIDNdIve2LRo00XMHwZCQRe0zPGcWYh+Dn/ec/9Na72t3VWvu6qtAXvUUIup+5med1B
         PY2w==
X-Gm-Message-State: AOJu0YwS2fK8L6wvSUV8NTwheoYu6GZnUQ5obYOKaSZNYI86ex55yGQZ
        CctSk1KR5hXC5O+UgI0FreoOLJb3wvrySChI4T+qjUMiEFwIsgMr1lOdt/AuECg//EKUH1WciMB
        KSZ4tBD7okC+L16aC6xdtoWJYsnZMdadcWJl/pcsoPV9YWosU
X-Received: by 2002:a17:902:d2cf:b0:1cc:41e1:ba38 with SMTP id n15-20020a170902d2cf00b001cc41e1ba38mr7943521plc.66.1700086695791;
        Wed, 15 Nov 2023 14:18:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG1mh7ByOW2vMg8PJsNJgWpyGvG6kR0o2/0CQ9wNsnIup4FnKH5m/Qnxi9gYyv9HJaS+LfeBtQQrMrVgPzRX4=
X-Received: by 2002:a17:902:d2cf:b0:1cc:41e1:ba38 with SMTP id
 n15-20020a170902d2cf00b001cc41e1ba38mr7943498plc.66.1700086695397; Wed, 15
 Nov 2023 14:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20231116073950.02c0610f@canb.auug.org.au>
In-Reply-To: <20231116073950.02c0610f@canb.auug.org.au>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed, 15 Nov 2023 23:18:03 +0100
Message-ID: <CAHc6FU5qLYLw=EVodktQbEuBVZmV-tT1FpTvvaoPD1ezvRso1A@mail.gmail.com>
Subject: Re: linux-next: contacts for the gfs2 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Whitehouse <swhiteho@redhat.com>
Cc:     Bob Peterson <rpeterso@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Nov 15, 2023 at 9:40=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> Hi all,
>
> I noticed commit
>
>   2e6ef8aaba6b ("Remove myself as maintainer of GFS2")
>
> Currently I have
>
> Steven Whitehouse <swhiteho@redhat.com>
> Bob Peterson <rpeterso@redhat.com>
>
> listed as the only contacts for the gfs2 tree.
>
> Should I change that to
>
> Andreas Gruenbacher <agruenba@redhat.com>
>
> or keep Steven (even though he is not listed in MAINTAINERS)?  And should
> I add the mailing list as well?

I think it would make sense to put me in instead of Bob. Steve hasn't
been working on the actual code for a while -- even though he remains
a valuable source of information for GFS2 -- so I don't think he will
object to being removed here.

For the time being, I will be the only person screwing up the upstream
gfs2 repository, so I'll also be the person to fix things up again. In
that context, would it make sense to add the gfs2 list? Is this what
you would commonly do?

Thanks,
Andreas

