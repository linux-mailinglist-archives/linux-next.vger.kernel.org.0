Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5672A1EBFEF
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 18:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBQ0j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 12:26:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40832 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726814AbgFBQ0i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 12:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591115197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lxwhO1exzutRwzeUtw6dZLYIa64l9wkIQ9KC8Et54ug=;
        b=Dw+Jb7DcIWYCCzWwFS/HX9bLsk6vJ7ydHSAaKLHA8dago3RRvu13hjVE+41ltwTScbhNO6
        zvWdkiSW6xufk52onEhZnXEGXkKkjG3chI4nDlORfigytsJaGsnnVMSpV0IZ+5NhxCpDMX
        mlCMinGVUkboLdXiH6vbmQacFDedMeo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-vyT2JXuQOCGGGTD9ZpruDA-1; Tue, 02 Jun 2020 12:26:28 -0400
X-MC-Unique: vyT2JXuQOCGGGTD9ZpruDA-1
Received: by mail-wm1-f70.google.com with SMTP id u15so1043738wmm.5
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2020 09:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lxwhO1exzutRwzeUtw6dZLYIa64l9wkIQ9KC8Et54ug=;
        b=fVSH4OGwZPuj0WvNRZ2i++/5MQSYc+/jnR9bCkWWYIk2sWOtepD1ph9UVOuE0iSi9e
         xuKiU+v014lDR5bbXt4Lm67ku/530cg7PeyNfMhgNpaPpGxILLRUQrgeWMqWhGUpTAlb
         I9V0vxLpIxFJo8bx+IW4yH2btRpN17Wn8mG98GjIvS7qPGl1qgaeWsYr8gk7oA1OhTuh
         netEB3ovKw+isMDJrC/pLSv1JiRRaSWpCeuPafcb5z2sW13IXpg3d1z6Ke5YqG7lW+pO
         r72blfTPlhWhjPLaSgTYZPnHvtJfBL6QV4RSns2PvZeMfhKLj/4fWbSrauaVho6g4M8H
         +C4w==
X-Gm-Message-State: AOAM532WnOhVwHPG/4WX6S2Hej4ZtNh/hlIy4FWaYm+29U6vRTWioo3I
        8iGp342TdsZk+AI2HWvmIBTfijbk6OoDYUlPvIs5wVZzpnd/HsgdXFtaKcLRNRQx9ZtVAl2JyAu
        qLZixTKT/uEVhbGwnJu+www==
X-Received: by 2002:adf:b355:: with SMTP id k21mr20202845wrd.76.1591115187445;
        Tue, 02 Jun 2020 09:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBnLBOPdE3PHIXiidRK8EYw7wGULW73adAiJNldsEPiDl9iHSw2WfwVqfSXm3HWkszF4QGhA==
X-Received: by 2002:adf:b355:: with SMTP id k21mr20202827wrd.76.1591115187131;
        Tue, 02 Jun 2020 09:26:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a973:d537:5f93:b58? ([2001:b07:6468:f312:a973:d537:5f93:b58])
        by smtp.gmail.com with ESMTPSA id u74sm361365wmu.13.2020.06.02.09.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 09:26:26 -0700 (PDT)
Subject: Re: linux-next: manual merge of the hyperv tree with the kvm tree
To:     Wei Liu <wei.liu@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     KVM <kvm@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jon Doron <arilou@gmail.com>,
        Michael Kelley <mikelley@microsoft.com>
References: <20200602171802.560d07bc@canb.auug.org.au>
 <20200602135618.5iw6zd2jqzqqcwxm@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <feb8e292-8dff-58ad-0bb2-5006bf475e6b@redhat.com>
Date:   Tue, 2 Jun 2020 18:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200602135618.5iw6zd2jqzqqcwxm@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 02/06/20 15:56, Wei Liu wrote:
>>
>> between commit:
>>
>>   22ad0026d097 ("x86/hyper-v: Add synthetic debugger definitions")
>>
> Paolo
> 
> As far as I can tell you merged that series a few days ago. Do you plan
> to submit it to Linus in this merge window? How do you want to proceed
> to fix the conflict?

Hi, Linus can fix this conflict.

Paolo

