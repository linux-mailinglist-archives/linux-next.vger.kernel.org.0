Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FF1434208
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 01:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJSXXj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 19:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhJSXXi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 19:23:38 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC91C06161C;
        Tue, 19 Oct 2021 16:21:25 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id j8so20116510ila.11;
        Tue, 19 Oct 2021 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1YffYkhIkyiBX1RpmiIHmHRBxEHfykvk4rfLTMjU9mA=;
        b=Ley8yCZU66Hp8bphTPLcy5UPaVpS5ZB4zgSjDPDptNLf9/HIIzn6GN5Ogd1Y/nMGmM
         7o2cQFSJ4E/mCLdll08hCAZpvigPB1Ddo1s3v4t3l8ZgBcQNFvWBcuyO/NxXdWOSWwW3
         pLP5wFpA/qWKrP29P4UMkG1g/2NTutziqtq5tJFL4B42wcyEqTXqSPIoe1kjCXHQj0lV
         QthZ2PmMYScGVXYQRmt6Pc8ldAFRClLUo5xdLapVk8wIfs28gNUsIBZeS11eQm6nhWlO
         cydnewLyKdAdLlJNUxbFiCuOA0rJqJypBu15lyS/hbFNa1Ee7AdhmoDvsN1qkimmwl59
         vyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1YffYkhIkyiBX1RpmiIHmHRBxEHfykvk4rfLTMjU9mA=;
        b=1NR4VlETSXVioAKbhh7JaHFmdBNot4uouWW4oRdgYyZ6bY+eGP6iHr9vfr+ebZxwKA
         GNkED11QMUxYc5SQ6cJO9fIeVp+VATY/OErfrVYHP8un9NqsI6UXtqD5J+dhWpAvW/lQ
         TgYd86I51z0VaORM2deXheCJm0oWO6Jtt1lRL5C3nfw9+WpjLqNmrXnwSTRpVC65Ii24
         OtPLinMECNhKkCyTXRGVIcL3eJi9oY+WUB1tLfFfbIvJfdPGjFmx+7+Q7g65waPOMyHC
         yZATKuZCHSpVocu1BS3cRoZEBLiLqnIbaQlnHcT4JerbYXJ7h572+mUFmeRS5JDPzSL3
         AEnw==
X-Gm-Message-State: AOAM531Jj8mv7t6Y/a5YjTHPPoGT5wwXNpZJQFTeWBGTpvK5X+dCYE1S
        xrpicJ0jsMKYLE3X672/Givw72wU7MGlP5XmVe0=
X-Google-Smtp-Source: ABdhPJwOXYqZgY89d+8bJA5uSmqLQTkttqksAjYy+LSLDY4VIPPZm0dDQeR1NVdY6YonTTrKjDHNhuIVz7pRN+Ml2cM=
X-Received: by 2002:a05:6e02:1a0a:: with SMTP id s10mr21348652ild.76.1634685684069;
 Tue, 19 Oct 2021 16:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211020092258.71861678@canb.auug.org.au>
In-Reply-To: <20211020092258.71861678@canb.auug.org.au>
From:   =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date:   Wed, 20 Oct 2021 01:21:12 +0200
Message-ID: <CAHpGcMJXYcRcZi=zWjtXEJvBJM2hn9K2+jYJWjHCp6qbNAGU+Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gfs2 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Am Mi., 20. Okt. 2021 um 00:23 Uhr schrieb Stephen Rothwell
<sfr@canb.auug.org.au>:
> Hi all,
>
> [expected 'struct gfs2_glock *' but argument is of type 'const struct gfs2_glock *']

fixed now. Sorry for the mess.

Thanks,
Andreas
