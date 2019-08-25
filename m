Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B579C555
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2019 20:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbfHYSB2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Aug 2019 14:01:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41294 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728649AbfHYSB2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Aug 2019 14:01:28 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5B43181F01
        for <linux-next@vger.kernel.org>; Sun, 25 Aug 2019 18:01:28 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id z25so8169888edm.3
        for <linux-next@vger.kernel.org>; Sun, 25 Aug 2019 11:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VuPnmNJDurZKvFGRfxNmSSRX0Kf/p44Qiikbipwhkj8=;
        b=oPASK/bLTJrgXKn822sLgj74bOVyOC8NGW73AyOyIMbz4N33PTsoxIjNh3CcBe5jQq
         haiGYmL3zC3x+BtlxFAo9DuF0fRy42Qr+PbqHuy6lo+YLu1VODa1oVm94DyZnOhw85C6
         1DAYInFENz4rUBluTXzLdj4DAqMt8Omgb2kkULPeRqa5v2kRxVXy53KhcR0Lu9ykbrx9
         Vzheo3Jh97hwx0veIc37yApITtrZRp9uNqyLdpFiOAquwTrnw+wdSKL2vIDCcWoRC1d+
         1OTbNJEecm/N2UVi4xwVPqF6AqafYc6QCXuQILu2NcnnBOv9jCI6LDMbceYpTwwKlojt
         zviw==
X-Gm-Message-State: APjAAAWYEpx9dL3hYTuQcckC4PGmbetA58DHtu8QVyqGugbialBy/CJw
        2XbpOz10rrdw2hyPRKKg00emO3und20ObHDFAWblb2PNQd8+s7QFcNeuxWFCkvQYB8CY89fLNm7
        R1AhyuaEvHo4AWEjYJ2GfLg==
X-Received: by 2002:a17:907:217b:: with SMTP id rl27mr13385280ejb.154.1566756087144;
        Sun, 25 Aug 2019 11:01:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdanELqZCMBQliTrwXuwFFf3bENMI0wKgiY7G4ECMVkDTHUjx65hs/OfIYn/w8wQyzEXadrA==
X-Received: by 2002:a17:907:217b:: with SMTP id rl27mr13385263ejb.154.1566756086903;
        Sun, 25 Aug 2019 11:01:26 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id x12sm2375442eje.1.2019.08.25.11.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2019 11:01:25 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the crypto tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190823131442.5a84a475@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce5be2de-5e6c-b571-fffe-99888f7cf3a5@redhat.com>
Date:   Sun, 25 Aug 2019 20:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823131442.5a84a475@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 23-08-19 05:14, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
> see include/linux/module.h for more information
> 
> Presumably introduced by commit
> 
>    01d3aee86625 ("crypto: sha256 - Make lib/crypto/sha256.c suitable for generic use")

Yeah my bad, I did not think about this getting build as a module.

I will submit a followup patch fixing this.

Regards,

Hans
