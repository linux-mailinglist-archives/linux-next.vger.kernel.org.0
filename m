Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176262DC1E5
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 15:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgLPOM3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 09:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49985 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726396AbgLPOM3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Dec 2020 09:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608127863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=AZK3BY1SOZ9R2ckWohlcN4a1h/UlipOs217v8NJUM+0=;
        b=ipRhmxsnC7hkaPGbXO/NBKxUsoTER4KZHQbUJIXyOpK9nTugdXomDU6g4frmp24J1XG9F3
        xyYvyn4Vg2HXp4pJU2ctkglrEuU1gxteYVaAglpsUWxkCmDRJqswk6V3I+4ybPeWrdf89V
        KhmQdKIZMAV7jKpY4tX6PmP7At+0xIM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-c2qu-BjcMEyMi9nuVxsz-g-1; Wed, 16 Dec 2020 09:11:01 -0500
X-MC-Unique: c2qu-BjcMEyMi9nuVxsz-g-1
Received: by mail-ej1-f69.google.com with SMTP id dc13so7418812ejb.9
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 06:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=AZK3BY1SOZ9R2ckWohlcN4a1h/UlipOs217v8NJUM+0=;
        b=MI13zMQXhbrLp4VJ2AP5kVoPqeN/6MB84IkS9V0tcXNP3xici8Q0DwRFbmMVYRFbDQ
         BPlOizXfuf+n3e90iEa+b0+MfmuAA9AR3y6IQC4l4Ib0s5ErToee/EvziKlryCQ0qUpA
         J8wtwZw5Xh45T/14qkbraMf3spidMh10r+sg5AQj21/RJbOWBZpgnL9y0SwgZobBiNnl
         vQYurSn1PENzk+4AjmcGEQ9UA/I9V2AxVKJ+8lD50YIsLA5VwwPXLC9JbJIj4OAYI+dp
         iS7YnTIfi7074Xeh0/lbxCO5I14EtL3Qfqiuep3ppDYGcPY8uvnV4AVrBikOCN/Q+LGZ
         4Vnw==
X-Gm-Message-State: AOAM530Q/zHiw/3gvXsAXlmyggNVvhX+5OqrX9gWkUFgyZjYCv1q8t5T
        Xlp9Hwde6A0DXrH2EZACTGmoU+2zlmHDSWjw33ktmgWoGJ8GI7tB42g+7SROK9BamgIsSreaGvD
        sH3yYNAE9zFEzBAtNpODuJw==
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr34281615edv.110.1608127859835;
        Wed, 16 Dec 2020 06:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXnJZUMqaetzQSIAhXrO5qzhyFdDoLF9nmnhq0IKMeCTSboqLbeG2lAR2BaN9AO/p+p59USw==
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr34281598edv.110.1608127859685;
        Wed, 16 Dec 2020 06:10:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id d4sm21954423edq.36.2020.12.16.06.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 06:10:58 -0800 (PST)
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Branch change for kvm tree
Message-ID: <c651fd52-e402-1474-38bc-6965470823cb@redhat.com>
Date:   Wed, 16 Dec 2020 15:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

linux-next is currently using kvm.git's "linux-next" branch. 
Unfortunately I have just learnt of this fact; KVM maintainers and 
developers have always used the "next" branch instead.

It seems like until a few months ago "linux-next" was a symbolic link to 
the "next" branch, but something must have changed since then on the 
kernel.org side and thus the branch is frozen to last August.

Would you please make the change to kvm.git's "next" branch?

Thanks,

Paolo

