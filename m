Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EF619971B
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 15:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbgCaNLX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 09:11:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57724 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730885AbgCaNLW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 09:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585660281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=usxsvV26fFHRpbo4EPS+A1tC2Knjsvias64PeyQykb4=;
        b=Pd09aNRTx7XGxXwLZinva4uei/9KO9yr+ZPN6NPcR3yLO9VcctJOMkfSUNUnO90XnsXe9T
        KPZ1BizpFU+fGphUof5mKic84Vuuwa6Yl/KxHvCUf1x6DqCMf6u4pJoAd1Te6HMTAWcXs8
        9sN524PCtu1Ht1ENULAuSUfLvWja69A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-hAg-7StZOAygxg4DDnmT6w-1; Tue, 31 Mar 2020 09:11:19 -0400
X-MC-Unique: hAg-7StZOAygxg4DDnmT6w-1
Received: by mail-wm1-f70.google.com with SMTP id t22so679683wmt.4
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 06:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=usxsvV26fFHRpbo4EPS+A1tC2Knjsvias64PeyQykb4=;
        b=k5ssNqYVJq4qJynRWGyZxRbHZxmkhb6BO8MoIC97wjMTSoGxo9pytUj6CoMcYLt7hI
         vv+AAscMvWTVYoYtc9GUCz9KNSLWhIbsLwtKoZztYwnYeXJ9RV9pCQa0AWeZ1vODymy1
         hQ7AC1S8hBpmhrJNlRO24koM6A4qbIhpGQDN7NM3aCLrEQ+saetYcT5wDYz4b/MdgS7e
         CbJ7I4u3y9j5Nig2n50BhFve24eziVEVceSvj+UE/DRC2wG9nOzuE/FQUtkoqIE3PCNk
         C7x/3Ygz+gzx2c/+dA3vvidZoyqgSaBMbKyGKHGQ+sb6exYbSkaiZXbUh/d6AvDEEyzu
         WfKg==
X-Gm-Message-State: ANhLgQ0n1ZnMaGK5KjX2JLfIKVnsC/mFG4jaxL1wrbaD2cEmx0rhgRqF
        KidwgfQKJc61vNv8ONKZjU4fdyC/OhRrUXpy4g7X1Y0dib9QKibDrGuYFps90LBoejXIiCfvMaw
        z23gw/HVJ3tkLM0jtIa3RjQ==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr19523932wrq.47.1585660278642;
        Tue, 31 Mar 2020 06:11:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vttjf+fvsMP8RlVLnva+uKSJYXT4yC5ZNHvDRMtCn+D/13PEya9eLPWLqUf0IcUzgcQvmLXLA==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr19523917wrq.47.1585660278456;
        Tue, 31 Mar 2020 06:11:18 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id n2sm28031408wro.25.2020.03.31.06.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 06:11:12 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:11:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        KVM <kvm@vger.kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: linux-next: Tree for Mar 30 (vhost)
Message-ID: <20200331085955-mutt-send-email-mst@kernel.org>
References: <20200330204307.669bbb4d@canb.auug.org.au>
 <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 30, 2020 at 10:22:22AM -0700, Randy Dunlap wrote:
> On 3/30/20 2:43 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The merge window has opened, so please do not add any material for the
> > next release into your linux-next included trees/branches until after
> > the merge window closes.
> > 
> > Changes since 20200327:
> > 
> > The vhost tree gained a conflict against the kvm-arm tree.
> > 
> 
> (note: today's linux-next is on 5.6-rc7.)
> 
> on x86_64:
> 
> # CONFIG_EVENTFD is not set

Oh, this is Jason's Kconfig refactoring. Vhost must depend on eventfd
of course. I fixed the relevant commit up and pushed the new tree again.
Would appreciate a report on whether any problems are left.


> ../drivers/vhost/vhost.c: In function 'vhost_vring_ioctl':
> ../drivers/vhost/vhost.c:1577:33: error: implicit declaration of function 'eventfd_fget'; did you mean 'eventfd_signal'? [-Werror=implicit-function-declaration]
>    eventfp = f.fd == -1 ? NULL : eventfd_fget(f.fd);
>                                  ^~~~~~~~~~~~
>                                  eventfd_signal
> ../drivers/vhost/vhost.c:1577:31: warning: pointer/integer type mismatch in conditional expression
>    eventfp = f.fd == -1 ? NULL : eventfd_fget(f.fd);
>                                ^
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

