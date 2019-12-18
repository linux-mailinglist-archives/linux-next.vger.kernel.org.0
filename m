Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B13124AC0
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 16:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfLRPKV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 10:10:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38614 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfLRPKU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Dec 2019 10:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576681820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QM58zRG2E33uopTi5C1OLZUP84XlNWgGlqpWQbuCIPw=;
        b=eAFlQ8PWyc5idYxnRbP3kQsyHNiR5db4+CFEwT1CnrbM8uAkyTk/dhk6nBkABlMjNS3Jgg
        b7nZBN4tjjay6iCfZktMZzXpfH3O2vxeu3oM36Bwuz3fKyWdb7VfnXBeAYjoRMg2CjwRTW
        qt/1x3KyX5szo4kCz2TV6aTgc15SFus=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-PMNkdoeONmSQ8PFwbI4vgA-1; Wed, 18 Dec 2019 10:10:17 -0500
X-MC-Unique: PMNkdoeONmSQ8PFwbI4vgA-1
Received: by mail-qv1-f72.google.com with SMTP id v5so1489504qvn.21
        for <linux-next@vger.kernel.org>; Wed, 18 Dec 2019 07:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QM58zRG2E33uopTi5C1OLZUP84XlNWgGlqpWQbuCIPw=;
        b=aGzV1+j/e86lik/iE9kT28LsP3epYMetiyENlo0t6jygk5jhlTqLA5CDnntUz2uwOp
         rfeO1IgEIf9+1xumN7awPTSfyY7Zy2dehxqWMl+sqWSph/gF4p1WAQts39S4y4XKkHXM
         2ZYGWONkUDGSiaDvmkNT4PbuBgA9xXXmyBGkCEgh9lZUZRhnSoYMoqgOq5eCBtsi1i7w
         m7FvH1OugSXescurGbBfXj6FN8xvn2f8Li8B3d/g0Tx7AcM4Ucx62fQP/AbP3dHXnJQH
         PbVyzIpo+4YqWyLus5M0v/LPw7U1VM947Y69f41sjrtlVLQHvM/7X31rA/7oDjjBl/0s
         TSdA==
X-Gm-Message-State: APjAAAWY0mhMq2KOylcmCvplG9tVXWOePN8cNN73U58AqnJA0p/LqUvV
        rOMwlMgvo6maYZ7xishyLlrABB4XUpJF88w4OY6yOgvXPYSW4h5UnYbwVsf83Y3nlTxw7qLdKip
        Tf9KMb5PdIQEW3fENwAH6ng==
X-Received: by 2002:a0c:e1ce:: with SMTP id v14mr2673044qvl.39.1576681816435;
        Wed, 18 Dec 2019 07:10:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhQfsc+4bORIeWfJPGw6vR+W11ECcHruYmI+Dy/4t2QYKRuVwYMstb8WaGcqyUqp1oBsusFQ==
X-Received: by 2002:a0c:e1ce:: with SMTP id v14mr2673022qvl.39.1576681816185;
        Wed, 18 Dec 2019 07:10:16 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
        by smtp.gmail.com with ESMTPSA id i19sm716606qki.124.2019.12.18.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 07:10:15 -0800 (PST)
Date:   Wed, 18 Dec 2019 10:10:11 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20191218100926-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 18, 2019 at 03:43:43PM +0100, Christian Borntraeger wrote:
> Michael,
> 
> with 
> commit db7286b100b503ef80612884453bed53d74c9a16 (refs/bisect/skip-db7286b100b503ef80612884453bed53d74c9a16)
>     vhost: use batched version by default
> plus
> commit 6bd262d5eafcdf8cdfae491e2e748e4e434dcda6 (HEAD, refs/bisect/bad)
>     Revert "vhost/net: add an option to test new code"
> to make things compile (your next tree is not easily bisectable, can you fix that as well?).

I'll try.

> 
> I get random crashes in my s390 KVM guests after reboot.
> Reverting both patches together with commit decd9b8 "vhost: use vhost_desc instead of vhost_log" to
> make it compile again) on top of linux-next-1218 makes the problem go away.
> 
> Looks like the batched version is not yet ready for prime time. Can you drop these patches until
> we have fixed the issues?
> 
> Christian
> 

Will do, thanks for letting me know.

-- 
MST

