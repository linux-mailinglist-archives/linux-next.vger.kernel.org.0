Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAF8231FEE
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 16:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgG2OIW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 10:08:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51652 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgG2OIV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 10:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596031700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tSDnY3FzGhTn/u6Pww0mdVOV9X0S2Fmn3lliAT+Fx3Y=;
        b=FI0Gq25tsVhoT1N15O0lxHDteh4O04FdKxKQLccHH/9cq9LMDPDKGHP358Q/fRivs0xXlK
        DdB7Zp+OS3EfesdnqgqyExb7JIPUMLdnt7qqIuOcJvBAWp41MlcigLQJrR6zOMNy7twHZy
        8DL/laVpTqFTUDXTONfGtO0ukp2yh7w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-L_7B9nLtMsO5XOyd-mYb3w-1; Wed, 29 Jul 2020 10:08:17 -0400
X-MC-Unique: L_7B9nLtMsO5XOyd-mYb3w-1
Received: by mail-wm1-f69.google.com with SMTP id u14so622081wml.0
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tSDnY3FzGhTn/u6Pww0mdVOV9X0S2Fmn3lliAT+Fx3Y=;
        b=qw56ZCMzhdgXqQBIuu8gowg89x4Igi64eCa8rVULQTBRKXITU5gyM1C9kIaC94xeA2
         F0zDib2lxnz/KVjAEGIL14sshdpsKjDmn9EPI7+Im4EqEhGb6z8jKKMzud7/GHar1eF9
         pjpW7uZzmPkRlfHaHrCV/W5Mkz/+/Yrg5wKf7iIxpdU7xP840ORwIgURGpKldjM1tk3s
         bC1AjJ3yB79MaYSpRJwaZb9CsIxP5YjvKziFLvgWxloGMRUAAwOXW91ny/YeyP4G1c3z
         eBX/YrK2Eo3SrVP0nQkR5UlK2DvEpI/jNVEemonFUcXBDGv8PT9+FyIkCr5/01A0idgN
         Mwrw==
X-Gm-Message-State: AOAM533ViKPJA/hxssxM+DJ9kiTt8qfP6mLu+pah7XSKT74wiYbYU605
        yGkFJFXVAiw7AMgbPtEHI3HAfjLcN+Lk3k3gMOB0m8CQTwq7Uv7ET2etNOl3m7PMnSkF6AzHNsk
        HtgEUGclSG6tqiupmBmRzYA==
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr6450731wmg.69.1596031696040;
        Wed, 29 Jul 2020 07:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZx2GDeOT4xiXXkyJbtLRy1H/T+pPmI/LpfhQCdBFqN5vPspeNyXF/MgS2kwoyjVW/b1BjZA==
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr6450724wmg.69.1596031695863;
        Wed, 29 Jul 2020 07:08:15 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
        by smtp.gmail.com with ESMTPSA id y2sm5487847wmg.25.2020.07.29.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 07:08:15 -0700 (PDT)
Date:   Wed, 29 Jul 2020 10:08:12 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20200729100754-mutt-send-email-mst@kernel.org>
References: <20200728181132.55476e07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728181132.55476e07@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 06:11:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vhost tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/virtio/virtio_vdpa.c:17:
> include/linux/vdpa.h:43:21: error: expected ':', ',', ';', '}' or '__attribute__' before '.' token
>    43 |  bool features_valid.
>       |                     ^
> 
> Caused by commit
> 
>   fee8fe6bd8cc ("vdpa: make sure set_features in invoked for legacy")
> 
> I have used the vhost tree from next-20200727 for today.

Sorry by bad, pushed to a wrong tag.


> -- 
> Cheers,
> Stephen Rothwell


