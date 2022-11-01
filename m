Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A660614506
	for <lists+linux-next@lfdr.de>; Tue,  1 Nov 2022 08:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiKAH1J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Nov 2022 03:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKAH1I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2022 03:27:08 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C09615A29
        for <linux-next@vger.kernel.org>; Tue,  1 Nov 2022 00:27:07 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n39-20020a05600c3ba700b003cf71011cddso371496wms.1
        for <linux-next@vger.kernel.org>; Tue, 01 Nov 2022 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U954tZlffYpNwCQjlBIVCid0V/1k28Ea5SZvChRW6P8=;
        b=TZUS6BUaMgnmuiCFWNiEPEmW5g0Eeivozy7kqc/4CnTR1V3qqzq+txSR8ezZk2cW7H
         vCDrd2pBqTY6FhZzrzvrI+bmJm9DezeK9NvMY1FeTJKaUwyQ3pBsriWY5teTGojcqYWg
         S7nl99nYGqIOwInOC/ijZcMTXq03YrXqQTJueK6urp1yWiv0jzxXby51fO7hwm5mkJfA
         Jo9wlTM4/8CJ3kc5qYI1hUS0/aLwPBrHrwU/yb59WHSm11Zh/4uP9YrJRi61oYbDrJym
         7tIzOEDKH7qXpw2MJTJpEq1wUDEyyxSw/gk/nduJ4cBJUcJun/KQHJiptl2YFmtY3x7D
         Bm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U954tZlffYpNwCQjlBIVCid0V/1k28Ea5SZvChRW6P8=;
        b=i23BTClYQ/B1CJ39ld3IyiDPg0ls4CFLHK6mdoI43PTr6NMxqdSDs+CMjn5RQpcgQN
         LbAl6Xrw02RRIuxGMeE3wW7IDzOOFpI7/9AzKLgEKTaH6yQWJ1WHU7V08Wvkn9Jws9g/
         HBas3IXhLa9DJ2jZ1TwUHR/OQ/CCx44yN0qU5XhZrxi4o45TGoVEhik5VlT1a2zkOIGK
         NRrXGhtvJtPam2AuCSAaYhaZWGsPTx7pHaJeXiDBNr6zUAXV1f8/wlgeOP16q1OvK9g4
         3zrzuJrXs2EQ/uS/vZELFB0zJ1FFMMwdYl1OyvNkGIqkIifunc67/a7JCSRQwHUkp4Wp
         NLXQ==
X-Gm-Message-State: ACrzQf2bYrK5RXOPL1C+7hJH8Bsucv74ZhtpDQIIQvGQ4j1fJUhDrsBx
        WT5wBjJ2Ahl0YF1Tv3FfqR0OIA==
X-Google-Smtp-Source: AMsMyM7C+KOkcL15tSD7dmIVFONZJSveK/Bpk9wLvfvZVH0W7z+uDOlYfdW7WRB6oANvEqe+QaGKfg==
X-Received: by 2002:a05:600c:5388:b0:3c5:4c1:a1f6 with SMTP id hg8-20020a05600c538800b003c504c1a1f6mr10942067wmb.11.1667287625759;
        Tue, 01 Nov 2022 00:27:05 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id z18-20020a1c4c12000000b003cf75f56105sm3799709wmf.41.2022.11.01.00.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 00:27:05 -0700 (PDT)
Message-ID: <06a34889-a54c-d521-0695-2595f108204d@linaro.org>
Date:   Tue, 1 Nov 2022 07:27:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: linux-next: build failure after merge of the nvmem tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221101142146.16f7b14e@canb.auug.org.au>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221101142146.16f7b14e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

VGhhbmtzIFN0ZXBoZW4sDQoNCg0KDQpPbiAwMS8xMS8yMDIyIDAzOjIxLCBTdGVwaGVuIFJv
dGh3ZWxsIHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBudm1l
bSB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NA0KPiBhbGxtb2Rjb25m
aWcpIGZhaWxlZCBsaWtlIHRoaXM6DQo+IA0KPiBkcml2ZXJzL252bWVtL252bWVtX3N0bTMy
X3JvbWVtOiBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGlzIDIwMCBieXRlcy4gIFRoZSBsYXN0IG9m
IDMgaXM6DQo+IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHg3MyAweDc0IDB4MmMgMHg3MyAweDc0IDB4NmQgMHgzMyAweDMyIDB4NmQgMHg3
MCAweDMxIDB4MzMgMHgyZCAweDYyIDB4NzMgMHg2NSAweDYzIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMA0KPiBGQVRBTDogbW9kcG9z
dDogZHJpdmVycy9udm1lbS9udm1lbV9zdG0zMl9yb21lbTogc3RydWN0IG9mX2RldmljZV9p
ZCBpcyBub3QgdGVybWluYXRlZCB3aXRoIGEgTlVMTCBlbnRyeSENCj4gDQo+IENhdXNlZCBi
eSBjb21taXQNCg0KQXMgdGhlcmUgYXJlIHNvbWUgb3RoZXIgY29tbWVudHMgb24gdGhlIHBh
dGNoLCByZW1vdmluZyB0aGlzIHVudGlsIHRob3NlIA0KYXJlIGZpeGVkLg0KDQotLXNyaW5p
DQo+IA0KPiAgICA1NWNhMzE5MmQwMDcgKCJudm1lbTogc3RtMzI6IGFkZCBPUC1URUUgc3Vw
cG9ydCBmb3IgU1RNMzJNUDEzeCIpDQo+IA0KPiBJIGhhdmUgdXNlZCB0aGUgbnZtZW0gdHJl
ZSBmcm9tIG5leHQtMjAyMjEwMzEgZm9yIHRvZGF5Lg0KPiANCg==
