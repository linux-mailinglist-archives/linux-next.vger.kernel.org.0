Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E116BE5AF
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2019 21:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387642AbfIYTaS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Sep 2019 15:30:18 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:45102 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392300AbfIYTaR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Sep 2019 15:30:17 -0400
Received: by mail-io1-f49.google.com with SMTP id c25so1708988iot.12
        for <linux-next@vger.kernel.org>; Wed, 25 Sep 2019 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=2fX27EsQ/uLv+4fcZ5O2eoVbp9zZF5MrMfgP0SWSalA=;
        b=QPzequX4ETb5snE5KWgVYNL8gWi0u5KEq6AMc4v4SGK1XiYX1l19w6A8H9o6qtpwYA
         0484tPbyUqflUm5njOTGm9+Sz9Rt5R64E+mN57g3RZpEZZaTSfEXIu0wL8Wiizeslpyn
         3O91UVu7620cNtjQJZ6BGDVD/XtWFn4o2b6TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=2fX27EsQ/uLv+4fcZ5O2eoVbp9zZF5MrMfgP0SWSalA=;
        b=QKj5mKB829WQrcFgQz9ps5wXYSDEgDzhbtvODV1QBI20c9ZVNfkLdyN+fQHefcFWbO
         UFKzEwQZ/EwG6XcrFnEc+PRNHCNPWGFrrVLEFCGqwLyEMdJKwAiFn++TZFvJAH0a01ty
         1UviSpCn2Sq+s5p6O0XeTuG3YdQvV20bdOEUhCj4bmbMIoPfgwm2txcuhC7CRAlhbukP
         1Y1sqzVpykj2p2yDoTde65C8QnZ7sbgwzh7V/ux0fvyFQlnZCxPhLcRyF3MveqEyoyla
         Dz4pnohNncd7WOBfnqppG5SxbK8kAJIFoWzza1CDwms3s7Ip+KvQNS69iBKX1UT5BlXn
         Iv1Q==
X-Gm-Message-State: APjAAAWbkHL4Rb/r9cUOsk1KGo40aVJcA2SlWUzkM4zS/Fw88a+qJOP/
        3ArpC3jll9Tx7NdEoky3ABh6Fw==
X-Google-Smtp-Source: APXvYqxxGn3TGpgsn34LLISJYJGUJKnvViopJjw9x7Y89DFOzICa1qTce099dAY4ijK5IVuigNbJRg==
X-Received: by 2002:a5d:9804:: with SMTP id a4mr1095061iol.299.1569439816836;
        Wed, 25 Sep 2019 12:30:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h17sm373264ilq.66.2019.09.25.12.30.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 12:30:16 -0700 (PDT)
To:     linux-next@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: Request to add linux-kselftest test branch
Message-ID: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
Date:   Wed, 25 Sep 2019 13:30:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark,

Please add the following linux-kselftest test branch to linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=test

please let me know if you have questions.

thanks,
-- Shuah
