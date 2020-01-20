Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD3F14233B
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 07:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgATG17 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 01:27:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57199 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725783AbgATG17 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 01:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579501678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iRXHfj3z+qLzyvphJ1jzEOvfcEubFJCVf/G360GhOFc=;
        b=M7RUSHsXMp8x4zRn+27AbQljvDhNVhg8UsmrPFVh+DGfppG2+CR/k2Mbplg/BRT3qNb+/E
        7QxEr1vJeaol0PbiB97BC/ShTL0Bcuwgz5fhIVroXi5ev7ssYARLRGVIZA1+1KaiVaiqsE
        G+Vm4XHg1kPpb2fzj7WA8Kd1JL/7vAE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-S9wIVjnfNkm6qh3I-OnX8g-1; Mon, 20 Jan 2020 01:27:56 -0500
X-MC-Unique: S9wIVjnfNkm6qh3I-OnX8g-1
Received: by mail-qt1-f198.google.com with SMTP id o24so20528264qtr.17
        for <linux-next@vger.kernel.org>; Sun, 19 Jan 2020 22:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iRXHfj3z+qLzyvphJ1jzEOvfcEubFJCVf/G360GhOFc=;
        b=JFtdfQQoHd+y5pEZtUnWVMoHlE8nZp5Rb6bxxJqnnxKARZsq36Vxj1Xpck5oJR2qYW
         I31I+S7i1D3x4uH6BTrmtjd+6FGi3OaM/lVoDsqUOWayWa1YegJx7M041DFnLYGsSL2x
         c7WrD7LwbygHvHmxnFaxSI+X2dVYCfpd6dZHTZVwEOsio2ViJqpK/pEwNxZHUiSzgTFS
         Y/vsZh72+ctvzFuFcHhVfBJCZeBxEWCrkHgETL8YBG6bh1zaryWq1JzfmtWNPGVHyGhf
         QAZLBJKfhe88xjkfzIAgifwOVpbK/+z4WzIQUpafSV/GIllraOzdW6Wc7aPI6vYBbHYs
         k57w==
X-Gm-Message-State: APjAAAWZ4x3Q7V/W4kkHKY/xdZ8BYWIPn61I+ScpkE6S8mfIC8m+JyHM
        JTXzw+eRy/zoF2ALJWyo39lWNvSpvPLe8+e9IIVaRRF+svT0Poa9yS6RhZjn8d0QSQNKsgHDrkw
        ycyUOru1t8ENfau+stTXmPw==
X-Received: by 2002:a05:620a:98f:: with SMTP id x15mr49079774qkx.462.1579501676110;
        Sun, 19 Jan 2020 22:27:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZe1/Gynw9EyezEIEc3j5X8dVt+5Pvag5q9o1DBcyvgoW1L9uIjDRR7cdioBxMsBroG0JIpg==
X-Received: by 2002:a05:620a:98f:: with SMTP id x15mr49079759qkx.462.1579501675863;
        Sun, 19 Jan 2020 22:27:55 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
        by smtp.gmail.com with ESMTPSA id d3sm16680931qtp.25.2020.01.19.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 22:27:54 -0800 (PST)
Date:   Mon, 20 Jan 2020 01:27:50 -0500
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
Message-ID: <20200120012724-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 07, 2020 at 01:16:50PM +0100, Christian Borntraeger wrote:
> On 07.01.20 12:55, Michael S. Tsirkin wrote:
> 
> > 
> > I pushed batched-v3 - same head but bisect should work now.
> > 
> 
> With 
> commit 38ced0208491103b50f1056f0d1c8f28e2e13d08 (HEAD)
> Author:     Michael S. Tsirkin <mst@redhat.com>
> AuthorDate: Wed Dec 11 12:19:26 2019 -0500
> Commit:     Michael S. Tsirkin <mst@redhat.com>
> CommitDate: Tue Jan 7 06:52:42 2020 -0500
> 
>     vhost: use batched version by default
> 
> 
> I have exactly one successful ping and then the network inside the guest is broken (no packet
> anymore).

Does anything appear in host's dmesg when this happens?


> So you could consider this commit broken (but in a different way and also without any
> guest reboot necessary).
> 
> 
> bisect log:
> git bisect start
> # bad: [d2f6175f52062ee51ee69754a6925608213475d2] vhost: use vhost_desc instead of vhost_log
> git bisect bad d2f6175f52062ee51ee69754a6925608213475d2
> # good: [d1281e3a562ec6a08f944a876481dd043ba739b9] virtio-blk: remove VIRTIO_BLK_F_SCSI support
> git bisect good d1281e3a562ec6a08f944a876481dd043ba739b9
> # good: [fac7c0f46996e32d996f5c46121df24a6b95ec3b] vhost: option to fetch descriptors through an independent struct
> git bisect good fac7c0f46996e32d996f5c46121df24a6b95ec3b
> # bad: [539eb9d738f048cd7be61f404e8f9c7d9d2ff3cc] vhost: batching fetches
> git bisect bad 539eb9d738f048cd7be61f404e8f9c7d9d2ff3cc

