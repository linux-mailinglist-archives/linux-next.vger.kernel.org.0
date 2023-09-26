Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D86F7AEAE5
	for <lists+linux-next@lfdr.de>; Tue, 26 Sep 2023 12:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbjIZK5u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Sep 2023 06:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbjIZK5t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2023 06:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077B111F
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695725813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ztsEuAgPuapaTM08P0SEgj/D/uEMY0v9vX8pBVttsrE=;
        b=V2s2oOB/yhiQwQ/13eD2eTSEHK32TJDBGIHxwMb+tLsvrHM5BIqtnpHEkc3iG4iNdt0LqD
        He1ST7XmPrgaKd+6+5gJj0JnLa7FMSh2RTQCyJ36T3FIAnqzmFAjW37oxssUTuumbCIYka
        jiH8WbtrOyKrnZ3Obx8HVI1767wHVZc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-pecQRvvtN8mN5bFRFaEN4Q-1; Tue, 26 Sep 2023 06:56:52 -0400
X-MC-Unique: pecQRvvtN8mN5bFRFaEN4Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ae0bf9c0a9so714771466b.3
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 03:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725811; x=1696330611;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztsEuAgPuapaTM08P0SEgj/D/uEMY0v9vX8pBVttsrE=;
        b=UWh2lMTWGxL4TBH4o3GOBFV2FIy3APbEV+elgJnKLE9fEnLIe5HttE/CyKGQeiXs82
         KUW7qFfNnowFb4COS/7sSpe4pYUIx/gd5xzW+1D/HlIBOJKBxfRCgaxY0rM6rVTQRhBh
         okw2eV/STFcg+6e+AAmUWBHQgWD+7Nn7Z6nYxvZbnnGEUWp48PWZUSQUu8tHCq38fd5A
         QSpEk/HrSOR7rBMjzR90Fd0zpZhHIKlfsFJPRGFXgDu0QmNQkH3xOXv2hhzXV42OvtSU
         MTlBwd8zu3yktJ8YXQbOqjETGGqv21CNdh5vtKqfYSBM1f2lJLhgvcQeXLZqjMVg+rrt
         DFlg==
X-Gm-Message-State: AOJu0YyzTCbNjFqWosPB3eyX6WUbJEi8Wj6/4aGBCWMoTL7vEg05zkIf
        sKTk7GiKFttfP0/xSs1ljP1MdZYHrotHDhUe5XARo9A5H3ooQy5CDtDXWw718rr4Gz1biEOtEaV
        eKhMVSvagqUGVuDekKhx4xA==
X-Received: by 2002:a17:906:8a48:b0:9a2:225a:8d01 with SMTP id gx8-20020a1709068a4800b009a2225a8d01mr8584479ejc.7.1695725810982;
        Tue, 26 Sep 2023 03:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Lokqy4lv4QzddH9koVW2cAZSwao+adaW7JEPfbJWs1+K0DKVx3+AGJPCG9KvFElCfknlIg==
X-Received: by 2002:a17:906:8a48:b0:9a2:225a:8d01 with SMTP id gx8-20020a1709068a4800b009a2225a8d01mr8584471ejc.7.1695725810692;
        Tue, 26 Sep 2023 03:56:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id jt24-20020a170906ca1800b009929d998abcsm7575268ejb.209.2023.09.26.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:56:50 -0700 (PDT)
Message-ID: <3a093a6d-3f7f-fd5d-923c-ef80840316f2@redhat.com>
Date:   Tue, 26 Sep 2023 12:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230926150725.4cca5fc5@canb.auug.org.au>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230926150725.4cca5fc5@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 9/26/23 07:07, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Error: Cannot open file /home/sfr/next/next/drivers/gpu/drm/drm_gpuva_mgr.c
> Error: Cannot open file /home/sfr/next/next/include/drm/drm_gpuva_mgr.h
> 
> Introduced by commit
> 
>    f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
> 

Thanks for reporting this, fix available here:

https://lore.kernel.org/dri-devel/20230926105146.10808-1-dakr@redhat.com/

- Danilo

