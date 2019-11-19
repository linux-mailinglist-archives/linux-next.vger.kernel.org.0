Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796D5102827
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 16:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfKSPdr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 10:33:47 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:38112 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbfKSPdr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 10:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7k98xFtkO3R8OY2GTrR+n6nxLnbfq1kjR6KlJVfIm+M=; b=fLtFRfU5eeKhmoEe0pKbpvvBb
        l3MY1BEVYKISFsskQDSLnZTbqlBl5NAwWVFE42zgiApxtamP25+7J7aWm0p37iX0AKjSSkEZ3N+I0
        9IamcDFOqg9O9LUZP8UFWkRUde2JBRIsDbE8qQ3xgsBubOlDqoOovIvonAyPf90Yj74kld27Tv82R
        s207u98tRCi1+5hTd9033FbkbbNzqsVe3FKlzINCebCxcJMW3v6B8EHip9kIc7/5jjX7lOUGlVwOn
        MrRki1XSPPK+/itwDbDp+36uxulpH0VJAK02JchWYDWOmiOu8CWOjbT88ha+54EvIGO5SiJ1295Qo
        t9NJ8Xpfw==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iX5Vi-0002IW-Uf; Tue, 19 Nov 2019 15:33:46 +0000
Subject: Re: linux-next: Tree for Nov 19 (i915)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20191119194658.39af50d0@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1d30acd4-9947-d228-967f-c4e76ebca832@infradead.org>
Date:   Tue, 19 Nov 2019 07:33:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119194658.39af50d0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191118:


on x86_64:

ERROR: "pm_suspend_target_state" [drivers/gpu/drm/i915/i915.ko] undefined!

# CONFIG_SUSPEND is not set

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
