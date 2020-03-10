Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71380180708
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 19:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCJSix (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 14:38:53 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2545 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgCJSiw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 14:38:52 -0400
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 273686508D9D73721EED;
        Tue, 10 Mar 2020 18:38:51 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 18:38:50 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 10 Mar
 2020 18:38:50 +0000
From:   John Garry <john.garry@huawei.com>
Subject: arm64 system corruption on linux-next?
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <8c018ee5-de2a-d948-fcae-feaf1303e160@huawei.com>
Date:   Tue, 10 Mar 2020 18:38:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

On my arm64 Huawei D06 dev board, I see this on sometimes on linux-next 
20200310 just as the boot completes:

[   48.452674] pcieport 0000:b4:01.0: Adding to iommu group 40
[   48.473426] rtc-efi rtc-efi.0: setting system clock to 
2020-03-10T18:31:29 UTC (1583865089)
[   48.473426] rtc-efi rtc-efi.0: setting system clock to 
2020-03-10T18:31:29 UTC (1583865089)
[   48.486755] hid-generic 0003:12D1:0003.0001: input: USB HID v1.10 
Keyboard [Keyboard/Mouse KVM 1.1.0] on usb-0000:7a:01.0-1.1/input0
[   48.486755] hid-generic 0003:12D1:0003.0001: input: USB HID v1.10 
Keyboard [Keyboard/Mouse KVM 1.1.0] on usb-0000:7a:01.0-1.1/input0
[   48.491033] ALSA device list:
[   48A device list:
[   48.522304]   No soundcards found.
[   48.522304]   No soundcards found.
[   48.526319] input: Keyboard/Mouse KVM 1.1.0 as 
/devices/pci0000:7a/0000:7a:01.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:12D1:0003.0002/input/input2
[   48.526319] input: Keyboard/Mouse KVM 1.1.0 as 
/devices/pci0000:7a/0000:7a:01.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:12D1:0003.0002/input/input2
[|Uz
���p X4n0Jj ЬH,p~wv�^;�~Tt�k�v��"��±�
                                       �rZ�,� � ��Hk��
                                                       v7�C (���� չ�E^�- z
                                                                          �
±� 
  � ��� �\ ���p X4n0Jj p�H,p~wv�^;+~Tt�k�v� "�
w�b���P�k�h�P��.�p���N�P P�X��9� 0� �k�h�P�i.�p���N��&�����.¬�jP�V�v 
t�Y��*�v���� �F9�


The system is still alive, as keypresses respond with garbage.

Full dmesg:
https://pastebin.com/C2Xy0yUW


v5.6-rc4 is ok from my attempts.

Anyone else see such an issue?

Thanks,
John
