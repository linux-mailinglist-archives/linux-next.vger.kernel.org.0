Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C945E60D8C1
	for <lists+linux-next@lfdr.de>; Wed, 26 Oct 2022 03:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiJZBNs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Oct 2022 21:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiJZBNs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Oct 2022 21:13:48 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAF0E7791
        for <linux-next@vger.kernel.org>; Tue, 25 Oct 2022 18:13:47 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id f23so12582550plr.6
        for <linux-next@vger.kernel.org>; Tue, 25 Oct 2022 18:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gggPBAdhwzHx2K1mydrKo8NbjmVha3/Mzmm/f3GMSRU=;
        b=TrJkrw/wSHS5X3vvLUaKxFJtrzPtH5iTzVd7Vcjqm9q+T40od8a4eYZJ/tdXYPXti3
         X2CD6GMeTxCHU9skHFuPbjb0De5yMEaMtfbMzKuQ4oAG7grxMIsgF+oWxoHhQFu3e5it
         +/haYeMQxrDLQmdWmELgZoaKC5+zqg3EzlDNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gggPBAdhwzHx2K1mydrKo8NbjmVha3/Mzmm/f3GMSRU=;
        b=L9+VIDLv7LhxnRZXpZo+c1SnSqDaFvFdL+E3HVIkyfkuYplgnJtqF8utwNKwKMAhCl
         E0mfIWfKQPkEKOM3XMSx/XDLWj/fIFzmuDs0GL/BEYi3EomL4crWGMqy9Q6n1XUqxc6J
         3mL4VwN1c1pUYAyTMInN6RlU1KmSI9bVaIGXuVJ4wdISP69bcdv4CclczIMKSmYeVkfi
         +uNC7hsd9F2OyjyetB256aoos6lv3WsmBc52r1WaYXy9SqUD9dwfJsa11jHfQnjYefRB
         VL3gCZZAhjlw4RD9eSxS9O2MrrnFD0wWlVJdjnhZ4DgdXItUnpvw4u47I93GuYQJ7RFb
         7vaA==
X-Gm-Message-State: ACrzQf3wqQ30+DdZYANHx+L7hcuICuIzc6zH/FoJpYrqpy/olW4kGmPs
        pbQAqpO8USs1KMSY0m35TPRnNA==
X-Google-Smtp-Source: AMsMyM5JEmI8MymPbUu6llAYi+U3etJHqlQZAkTVnxE/sJy0QUl7WqIthyrxmdjrIhdstLQHrYVdMQ==
X-Received: by 2002:a17:902:6bc8:b0:178:81db:c6d9 with SMTP id m8-20020a1709026bc800b0017881dbc6d9mr41814359plt.56.1666746826901;
        Tue, 25 Oct 2022 18:13:46 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:faf6:e503:6cac:3b53])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090a158f00b00212d4c50647sm189268pja.36.2022.10.25.18.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 18:13:46 -0700 (PDT)
Date:   Wed, 26 Oct 2022 10:13:42 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-ID: <Y1iJxiAky+k7Tgaf@google.com>
References: <20221026115748.24b57082@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026115748.24b57082@canb.auug.org.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (22/10/26 11:57), Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/blockdev/zram.rst:304: WARNING: Title underline too short.
> 
> 10) Deactivate
> =============
> 
> Introduced by commit
> 
>   410119cc7a63 ("Documentation: document zram pool_page_order attribute")

Will fix. Thanks!
