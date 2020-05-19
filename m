Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B4E1DA5A1
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 01:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgESXeZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 19:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgESXeY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 19:34:24 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A39C061A0F
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 16:34:24 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id m64so1182434qtd.4
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=83We/Mr70MD4EiPjp3ORsT3cMcT/fqJs14tN4jNeALQ=;
        b=PkphyJ7hrxzRIXZc1vTx3ePPg+qMN0P9FJW23j3vkeG6cR/IEDJ/PwVVPr6rCKgWR0
         uxvwEXp4zKZdEVYxUY69qlwGe5ZyVTaJGaaT1bzFTVKt1vgr7pxDlsnYxf8Y0d1Ovgwn
         OzKAq6f/cur7NV34ENpzm4F/vlOOfNELAQKKSPDLo9i97t3S/vYUWxDYZL3Q2xnNSNfd
         MqzNBNj2mMHsZWOpwpsmZ2GcyYXih8I1LBb+TP9g4008Yky3ReTsA98JRP0oJX+Bop8+
         5cIa+4xSluFY0CXJ/PN+E3BAs/d+atY3iqCAmZ4R+Fg60LjUmaWFJsv2N3+6RZCpwYRa
         FPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=83We/Mr70MD4EiPjp3ORsT3cMcT/fqJs14tN4jNeALQ=;
        b=cviq3CgLup9IknLxklukegTwzWNB2Kjv9YtpMaIPyHL0vZ0rgBeNl/JdUJORaQ3A/2
         RTk1cXQ8Zxm3qSr0wwNpR6yMEOMoOz11MuWMfA+R7YaHcuUrdRTTekziUl7KSV3Pbv/o
         Mr6e/mdv/y8JIaY6W/6VAFOMhLAnUiU3D/K1EaKak/OlMPJ9tgRdHSXaVhNoHANk9m02
         O8oIM/qjylZ6t0kve4zacuyVuMVrCGS/s/ofHF2NMNXoVh8JlE2/e3Pxt83V0eW394E6
         4ZxuJuDHvR/OOzNh4fz7EOXHljxOZ5ELYTJMD2J9xZfXF3DUlfB4TaRa1b9f0mLN6ZI6
         V+vw==
X-Gm-Message-State: AOAM533iiuVyIJWqPoykGZZIqLZ/PlmMUjxRGc1dI8ZTobr1UiDzDGOv
        DTbcGB2g5g1WjCVjn6wAQtFEifHf+1E=
X-Google-Smtp-Source: ABdhPJygMA9fyOWgOnUo1Gb9cez3ltp5DMCbIVcY0rTqNsUnj53c07XtG+LOljH5lXbHjeZzzd6pXA==
X-Received: by 2002:aed:2b67:: with SMTP id p94mr2555408qtd.255.1589931263151;
        Tue, 19 May 2020 16:34:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id z25sm1069973qtj.75.2020.05.19.16.34.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 16:34:22 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jbBkc-0003Tj-1A; Tue, 19 May 2020 20:34:22 -0300
Date:   Tue, 19 May 2020 20:34:22 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc:     linux-rdma@vger.kernel.org, linux-next@vger.kernel.org,
        jinpu.wang@cloud.ionos.com, dledford@redhat.com, axboe@kernel.dk,
        linux-block@vger.kernel.org, bvanassche@acm.org,
        rdunlap@infradead.org, leon@kernel.org
Subject: Re: [PATCH 0/1] Fix RTRS compilation with block layer disabled
Message-ID: <20200519233422.GB12656@ziepe.ca>
References: <e132ee19-ff55-c017-732c-284a3b20daf7@infradead.org>
 <20200519080136.885628-1-danil.kipnis@cloud.ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519080136.885628-1-danil.kipnis@cloud.ionos.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 19, 2020 at 10:01:35AM +0200, Danil Kipnis wrote:
> Hi Jason, Hi All,
> 
> this fixes the compilation problem reported by Randy Dunlap for RTRS on
> rdma for-next.
> 
> Jason, am I even doing the right thing sending the fixes for the issues
> reported for the for-next for RTRS/RNBD to here?

Yes, I will take them.

Do not send cover letters for single patches please

Jason
