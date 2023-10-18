Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE247CEA5B
	for <lists+linux-next@lfdr.de>; Wed, 18 Oct 2023 23:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjJRVzT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Oct 2023 17:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjJRVzS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2023 17:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2052EEA
        for <linux-next@vger.kernel.org>; Wed, 18 Oct 2023 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697666076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4jWkQJoQJpr/+kS89LQbgqhi6sZMu3/0SRnAPjzjxsM=;
        b=aWBUAbjiL9F6vg5M95LtIivRPbmmdm+sOcDlcNZh+2HvgwHJ4D90GDtVzUwe6kgau8D8C5
        +3/Ltl/s6o79amgKWCAza/10Zu3I2KUs12/0zeJymxf+ywZgVyz0ctgD4Oz9E1QQoMSRF4
        SoCGGe59sr+3VSjMpCChLL+Gctfz1uo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-VxWJjYqaNmOSjeLGKrosKw-1; Wed, 18 Oct 2023 17:54:34 -0400
X-MC-Unique: VxWJjYqaNmOSjeLGKrosKw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c51e44a4dbso41002711fa.3
        for <linux-next@vger.kernel.org>; Wed, 18 Oct 2023 14:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697666073; x=1698270873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jWkQJoQJpr/+kS89LQbgqhi6sZMu3/0SRnAPjzjxsM=;
        b=ah0MGCvf9SfTIQMWXhgPfvKaGLS6ZT8Y8GAWMhu9nDBKqPvRgm+1ennuJJXGO5wcKK
         BZx+AvtvKCxsO4bBcZhQcjuRLl8JVZnTBdT9G/9nucedmNDjHBI22cXFqQvIi9MEZExF
         VTf4PuqsjFdTYH4xPft24OAI4iX0uLbcIsxQalZgOo601Z4PsRjc+JGnKfYPEKsTdwNM
         CdaDCScii3226iV3r75tdndrI43Ay6cPxLDndRY0SS6pKfM3USif55auG3pNDwK1Kdba
         Yrs/Wq/pGyqabf53EuVJuMqgOBe7L4n4CVb0m/+ngFJdLT2fmmHLj9BSuhL7T1ixf456
         zj2w==
X-Gm-Message-State: AOJu0YzFO1ltRvwXkwFEDvv3FriAPuaEaNVTGgbcazaeMNfgHyu719Wv
        L0I/qiJGPoYcbBcWMpA7+PT8XvFEir2hXkdqerV59AJoiXQghB+MdetxINx6acvbNKW5rrJFFRv
        6jBxaIWwT740XsH2uMJF0Ow==
X-Received: by 2002:a05:651c:1542:b0:2c5:1d11:5688 with SMTP id y2-20020a05651c154200b002c51d115688mr163170ljp.14.1697666072875;
        Wed, 18 Oct 2023 14:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgbtzM61FKFYPQPOG7eZJ70Sg/h1vdwbbcL0MLTkVKZ5S1zlAptVNOKCFfQ5SYbpcvcaFMOA==
X-Received: by 2002:a05:651c:1542:b0:2c5:1d11:5688 with SMTP id y2-20020a05651c154200b002c51d115688mr163157ljp.14.1697666072515;
        Wed, 18 Oct 2023 14:54:32 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:2037:f34:d61b:7da0:a7be])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c1c8600b0040839fcb217sm2774655wms.8.2023.10.18.14.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 14:54:31 -0700 (PDT)
Date:   Wed, 18 Oct 2023 17:54:28 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vhost tree
Message-ID: <20231018175411-mutt-send-email-mst@kernel.org>
References: <20231019084309.3bda85c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019084309.3bda85c4@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 19, 2023 at 08:43:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   34ad6689c509 ("vdpa/mlx5: Expose descriptor group mkey hw capability")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks for letting me know!

