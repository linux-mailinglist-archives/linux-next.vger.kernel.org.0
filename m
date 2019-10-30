Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77691EA7B9
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 00:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfJ3XZT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 19:25:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22443 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfJ3XZT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2019 19:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572477917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tJ1MSZzMLDEO0OgbsgxLdqPc9Wad6rEGEERX1y/YXuc=;
        b=GVkZT9YM8kfKP65586aEyg/A+klwbVG0R0jEPKCBH9zEK9cawil7GmdffJke+OAKyYRc1p
        TxIFbsJaJo+bOyGPTQ3z8g9YAkoJwkGhaQ+IeLdYF4U39GFYwiBxaKF3rtMNDXiI1jAib4
        QFjVfgv+p9VTtwkVVkj0SPQ2MTSaWVE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-6k9_kzV0Py6byfV8Atw0Lw-1; Wed, 30 Oct 2019 19:25:16 -0400
Received: by mail-qt1-f198.google.com with SMTP id v92so4210512qtd.18
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2019 16:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bQFkVyYFi8hag3At5ZE72O/aG1IU1WcgEzzZGm8W/yY=;
        b=jA5wvMgIn+oHLovU/WayhLRSvUxqcMO3wW1GB2Uex8VR32O1MAlDy6PGQSLMfmmZsx
         w+ewiZV4RXbxjWAKLP4bBLnbSxxPRMW55KXqRZH1s8noFj+MUC+Me8s0rChagJBY9jmx
         Sh3KVmrCAzMMAHz/muEqxMS45/i6GWOyOiDUoAsYVsCvvY+QnVT9SjopK8GDRNfW2kPO
         tdaGm6L9FO5ayeIhD7NnOD1nzmnPZ3Yw6rIRWf4OiHv+hnmGJbjVnRsk6+KWI17gS00I
         c2mqLORrGMbk1FhqOxZMHjP821Q3qarEH0kJbEVrER5Lhw4cRSwOojS7IjL6uo1be61L
         BqXA==
X-Gm-Message-State: APjAAAXeRZ0LawMb2+D7rH+QCEuPtRneGvXWDrfNoZ2YU9d8qDgUE+eO
        b+C7HhveyxNMI3DiGG0kibm8gxJi3uc5sP/3RyF1iAFKdBSUitvtCW39fBWsm9HgiQHmOUSF1Rk
        R4XHvip6nK2ZeMmSrAjfsug==
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr1679813qvs.185.1572477915996;
        Wed, 30 Oct 2019 16:25:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqya63mUMpcS/++yI/vMJ7TUMWDzAtmYepIWeYl2T0nCu7UdIJ2I0dwkq34m7+mgWtvRrwkPPw==
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr1679787qvs.185.1572477915731;
        Wed, 30 Oct 2019 16:25:15 -0700 (PDT)
Received: from redhat.com (94.222.26.109.rev.sfr.net. [109.26.222.94])
        by smtp.gmail.com with ESMTPSA id v13sm791419qkv.132.2019.10.30.16.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 16:25:15 -0700 (PDT)
Date:   Wed, 30 Oct 2019 19:25:07 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yin Fengwei <fengwei.yin@intel.com>
Subject: Re: linux-next: manual merge of the vhost tree with the pm tree
Message-ID: <20191030192308-mutt-send-email-mst@kernel.org>
References: <20191029151928.780c8ede@canb.auug.org.au>
 <2535052.Q9mzRWFaI7@kreacher>
MIME-Version: 1.0
In-Reply-To: <2535052.Q9mzRWFaI7@kreacher>
X-MC-Unique: 6k9_kzV0Py6byfV8Atw0Lw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 11:13:57PM +0100, Rafael J. Wysocki wrote:
> On Tuesday, October 29, 2019 5:19:28 AM CET Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the vhost tree got a conflict in:
> >=20
> >   drivers/acpi/processor_idle.c
> >=20
> > between commit:
> >=20
> >   fa583f71a99c ("ACPI: processor_idle: Skip dummy wait if kernel is in =
guest")
> >=20
> > from the pm tree and commit:
> >=20
> >   a04c0533b07c ("ACPI: disable extra P_LVLx access on KVM")
>=20
> Well, if this touches code under drivers/acpi/, it should have been CCed =
to
> linux-acpi@vger.kernel.org, but I don't recall seeing it.

It's an old RFC, posted a couple of years ago.
I guess I can drop it for now.


> > from the vhost tree.
> >=20
> > I fixed it up (I just used the pm tree version) and can carry the fix a=
s
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> >=20
> >=20
>=20
>=20
>=20

