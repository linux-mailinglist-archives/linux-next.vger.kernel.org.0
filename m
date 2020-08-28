Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE78255BD2
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 16:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgH1OCF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 10:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbgH1OBy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 10:01:54 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7C1C061264;
        Fri, 28 Aug 2020 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=csZbeMn1T/DNqs11oUqU+A7IfqcuBZdTwU0OBfY6gno=; b=RFC4tUf8vrM5z1mHzdR7m6mymD
        VfXWe6eKfp8u1K0I3EJEzPNYjK4mFZ/6EKVQ93lQHP/9ZKW2vakpwz5apwHmRZryeay+s/utf8egh
        o1pG/T/MsXm2RFB5sPDMntxlKIo8Bxw+pxK5aHXnWYHUw1CMEgPbyRuAFpq/z4ErNw8rBInl/JoqD
        Q7tWzUL0YmgmTBLkvy2WFVT/xJ6Rznz9Zo5EvjcjhFmBDZ6MSqzJhnskOmiwnpIRlq7wOMmOBlvmo
        ZnylxBT+AfKUlbuWlPsQwQTkxVhs3p6Tcr+9BduKW0ZXKqomKK7sUPHwu/65bmp0J2vHGZAY6C3Yc
        UaKdcAaw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBeww-000514-C8; Fri, 28 Aug 2020 14:01:50 +0000
Subject: Re: [PATCH] drm: virtio: fix kconfig dependency warning
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>
References: <d3643dcf-87f4-ff45-fb90-9945458438f9@infradead.org>
 <20200828112535.yn75nbjtjepsq7w6@sirius.home.kraxel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ec31910c-b05b-f87b-6332-6ceac931154a@infradead.org>
Date:   Fri, 28 Aug 2020 07:01:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828112535.yn75nbjtjepsq7w6@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/28/20 4:25 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>>  config DRM_VIRTIO_GPU
>>  	tristate "Virtio GPU driver"
>> -	depends on DRM && VIRTIO && MMU
>> +	depends on DRM && VIRTIO_MENU && MMU
> 
> Shouldn't this depend on both VIRTIO and VIRTIO_MENU, simliar to the
> other virtio drivers?

OK, I'll send a v2.

thanks.
-- 
~Randy

