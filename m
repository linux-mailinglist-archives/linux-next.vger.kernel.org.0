Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B72FD15554F
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2020 11:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgBGKIF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 Feb 2020 05:08:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41607 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726860AbgBGKID (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Feb 2020 05:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581070081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hww+G4VML7m0WisANEdJ/P2iFS+sF+6xCl9lSHHOIXI=;
        b=GZNyT47P4sBVOv5mEFiLpxlW7Zi9bpvItskCrstQPTQ0wDqYnpy3PVdoI5maxuHpfGbfHI
        biueIGYIG5JoeBskT4v3g1cGan/GOYXkiKIzjvoBgnIsE0ywiyWGvZ1Wb/podA2Y9p8DjN
        XbE5+NuNIT65565jgNOFo7J84d3Qi/0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-eAseBQlcOOKt68AUuYRNUA-1; Fri, 07 Feb 2020 05:07:57 -0500
X-MC-Unique: eAseBQlcOOKt68AUuYRNUA-1
Received: by mail-qt1-f197.google.com with SMTP id l25so1352975qtu.0
        for <linux-next@vger.kernel.org>; Fri, 07 Feb 2020 02:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hww+G4VML7m0WisANEdJ/P2iFS+sF+6xCl9lSHHOIXI=;
        b=rZF80HdsXbNZBpTJfYdBXtc4drG0ekZrIQDKAxs94ATetM0PlGrsmGhv/bwNmx2ujA
         Hw8HGpmswsC48wQjLg4VNGaGycRrIejI4sLqkjBDBiPnro0hZ4nrBvQL7bwwe1yctnji
         chHNOfpqJsVya3TgaGk0RcE4FnVs/5rA0MdUdMLCQ/t+C4fMaUSmJUL2MZfvpPrkUEIC
         bOrXXZpVHzF0OJmSm1G3WlKUOMnVy0ZrashTu+xTvSwHAieIIZsEMIzUYKzdzuDXIDvp
         KyFrIDNPhMCrqDGqNNxjjwJjRbg3ouG3kaKF/hRiu5DxGTmFwiqOTTY+SHdW4HoCMHXH
         fBFQ==
X-Gm-Message-State: APjAAAXuG8z0i0gOhSUJWs85Ppvot5T/z44741A0TtlCw1O8xbQsqggL
        piRT1MsAMH1NIT1JovAUWsofMsQK35yO1KgmzT0lwK7hK3GjkqPPNzfYiClZAI1jUb3UwaRkfhh
        lI06yDBgB+7uJZzVP4hSLDw==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr6565025qkn.293.1581070076408;
        Fri, 07 Feb 2020 02:07:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2Tf4Dc3I9vhEU7wQz4PfOE2roZy7Xvp6VWxn/M6XGCbLGhkv3J1M03O/Eb7Fbru/j5RsZlQ==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr6565001qkn.293.1581070076110;
        Fri, 07 Feb 2020 02:07:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
        by smtp.gmail.com with ESMTPSA id g6sm1052150qki.100.2020.02.07.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 02:07:55 -0800 (PST)
Date:   Fri, 7 Feb 2020 05:07:50 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        eperezma@redhat.com,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200207050731-mutt-send-email-mst@kernel.org>
References: <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <20200207095353.08bc91e4.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207095353.08bc91e4.cohuck@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 07, 2020 at 09:53:53AM +0100, Cornelia Huck wrote:
> On Fri, 7 Feb 2020 09:13:14 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
> > On 07.02.20 08:58, Michael S. Tsirkin wrote:
> > > On Fri, Feb 07, 2020 at 08:47:14AM +0100, Christian Borntraeger wrote:  
> > >> Also adding Cornelia.
> > >>
> > >>
> > >> On 06.02.20 23:17, Michael S. Tsirkin wrote:  
> > >>> On Thu, Feb 06, 2020 at 04:12:21PM +0100, Christian Borntraeger wrote:  
> > >>>>
> > >>>>
> > >>>> On 06.02.20 15:22, eperezma@redhat.com wrote:  
> > >>>>> Hi Christian.
> > >>>>>
> > >>>>> Could you try this patch on top of ("38ced0208491 vhost: use batched version by default")?
> > >>>>>
> > >>>>> It will not solve your first random crash but it should help with the lost of network connectivity.
> > >>>>>
> > >>>>> Please let me know how does it goes.  
> > >>>>
> > >>>>
> > >>>> 38ced0208491 + this seem to be ok.
> > >>>>
> > >>>> Not sure if you can make out anything of this (and the previous git bisect log)  
> > >>>
> > >>> Yes it does - that this is just bad split-up of patches, and there's
> > >>> still a real bug that caused worse crashes :)
> > >>>
> > >>> So I just pushed batch-v4.
> > >>> I expect that will fail, and bisect to give us
> > >>>     vhost: batching fetches
> > >>> Can you try that please?
> > >>>  
> > >>
> > >> yes.
> > >>
> > >> eccb852f1fe6bede630e2e4f1a121a81e34354ab is the first bad commit
> > >> commit eccb852f1fe6bede630e2e4f1a121a81e34354ab
> > >> Author: Michael S. Tsirkin <mst@redhat.com>
> > >> Date:   Mon Oct 7 06:11:18 2019 -0400
> > >>
> > >>     vhost: batching fetches
> > >>     
> > >>     With this patch applied, new and old code perform identically.
> > >>     
> > >>     Lots of extra optimizations are now possible, e.g.
> > >>     we can fetch multiple heads with copy_from/to_user now.
> > >>     We can get rid of maintaining the log array.  Etc etc.
> > >>     
> > >>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >>
> > >>  drivers/vhost/test.c  |  2 +-
> > >>  drivers/vhost/vhost.c | 39 ++++++++++++++++++++++++++++++++++-----
> > >>  drivers/vhost/vhost.h |  4 +++-
> > >>  3 files changed, 38 insertions(+), 7 deletions(-)
> > >>  
> > > 
> > > 
> > > And the symptom is still the same - random crashes
> > > after a bit of traffic, right?  
> > 
> > random guest crashes after a reboot of the guests. As if vhost would still
> > write into now stale buffers.
> > 
> 
> I'm late to the party; but where is that commit located? Or has it been
> dropped again already?

my vhost tree. Tag batch-v4.

