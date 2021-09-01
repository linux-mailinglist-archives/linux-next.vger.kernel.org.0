Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D577D3FD891
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhIALUi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 07:20:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35100 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234678AbhIALUi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2021 07:20:38 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 181B2k2M081119;
        Wed, 1 Sep 2021 07:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : subject : to : cc
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=1uLl+JCz4S9e6TN+jLW/Ny/+ozUjBZuusm7jdYXuDbc=;
 b=aLPlckcqnJDWF2cEBPNEkmUQ+nV6MBNHc8sU0vGUsDHj6b66R8lvhm+fisrpJyBZEq4A
 UXYS3dqkcXX1UsJT16WwkLyD7HLnvobJq70VwOSjHZxUWdSJ/PUNETFd+wf1JvUurrao
 K7KyaxpV6B7R8gZOqlZR6zAGImPZyFT5wHse+y9UGoBvJGZdq5L96JVzrhbt5ZZIlnsw
 2KKFHYvt7l3K/LML+QvAJuZF+HKImYnPfIiSs+d6mMilL5m3mLYSEacMxdAV82xxx3ak
 5rKway2hhuOHardXybapfxwgHNa8D1g8Svpb0YYMfye7BYNXUdEzg10o5U6bToEGxDI+ Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3at56b600m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Sep 2021 07:19:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181B3Bjg083331;
        Wed, 1 Sep 2021 07:19:27 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3at56b600b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Sep 2021 07:19:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181B6hFq030147;
        Wed, 1 Sep 2021 11:19:26 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma03dal.us.ibm.com with ESMTP id 3aqcsdfs7k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Sep 2021 11:19:26 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 181BJPn042205626
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 1 Sep 2021 11:19:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3090A12416D;
        Wed,  1 Sep 2021 11:19:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 31E67124164;
        Wed,  1 Sep 2021 11:19:20 +0000 (GMT)
Received: from [9.43.110.185] (unknown [9.43.110.185])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed,  1 Sep 2021 11:19:19 +0000 (GMT)
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [next-20210827][ppc][multipathd] INFO: task hung in
 dm_table_add_target
To:     linux-kernel <linux-kernel@vger.kernel.org>
Cc:     linux-scsi <linux-scsi@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>, hch@lst.de,
        jack@suse.cz, axboe@kernel.dk,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        dm-devel@redhat.com, sachinp <sachinp@linux.vnet.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>, dougmill@us.ibm.com
Message-ID: <68dde454-965a-0c44-374a-a0ca277150ee@linux.vnet.ibm.com>
Date:   Wed, 1 Sep 2021 16:47:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ODi_EXi2QsMDI05CgcyxWJs4FQ6SWvtN
X-Proofpoint-ORIG-GUID: _jbh_IrJ6PcIkJ9w3qX0Kua1qO_ZKvIT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-01_03:2021-09-01,2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010065
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Greeting's

multiple task hung while adding the vfc disk back to the multipath on my 
powerpc box running linux-next kernel

Test:
$ multipathd -k"remove path sde"
$ multipathd -k"add path sde"

After above command multipathd task hung with continuous call traces on 
console, it requires reboot to stop call traces

systemd-udevd[180359]: Process '/sbin/mdadm -I /dev/dm-8' failed with 
exit code 1.
multipathd[180272]: mpathf: load table [0 62914560 multipath 1 
queue_if_no_path 1 alua 2 1 round-robin 0 2 1 8:64 1 65:0 1 round-robin 
0 2 1 8:144 1 65:80 1]
systemd[1]: Started Device-Mapper Multipath Device Controller.
multipathd[180272]: mpatha: sdl - tur checker reports path is up
multipathd[180272]: 8:176: reinstated
multipathd[180272]: mpatha: remaining active paths: 2
multipathd[180272]: sde: remove path (operator)
multipathd[180272]: mpathf: load table [0 62914560 multipath 1 
queue_if_no_path 1 alua 2 1 round-robin 0 1 1 65:0 1 round-robin 0 2 1 
8:144 1 65:80 1]
multipathd[180272]: sde [8:64]: path removed from map mpathf
multipathd[180272]: sdq: remove path (operator)
multipathd[180272]: mpathf: load table [0 62914560 multipath 1 
queue_if_no_path 1 alua 1 1 round-robin 0 2 1 8:144 1 65:80 1]
multipathd[180272]: sdq [65:0]: path removed from map mpathf
multipathd[180272]: sdj: remove path (operator)
multipathd[180272]: mpathf: load table [0 62914560 multipath 1 
queue_if_no_path 1 alua 1 1 round-robin 0 1 1 65:80 1]
multipathd[180272]: sdj [8:144]: path removed from map mpathf
multipathd[180272]: sdv: remove path (operator)
multipathd[180272]: mpathf: map in use
multipathd[180272]: mpathf: can't flush
multipathd[180272]: mpathf: load table [0 62914560 multipath 1 
queue_if_no_path 0 0 0]
multipathd[180272]: sdv [65:80]: path removed from map mpathf
systemd[1]: Starting system activity accounting tool...
systemd[1]: sysstat-collect.service: Succeeded.
systemd[1]: Started system activity accounting tool.
systemd-udevd[1156]: seq 5678 '/devices/virtual/block/dm-10' is taking a 
long time
systemd-udevd[1156]: seq 5678 '/devices/virtual/block/dm-10' killed
multipathd[180272]: sde: add path (operator)
systemd[1]: Stopping Device-Mapper Multipath Device Controller...
systemd[1]: multipathd.service: State 'stop-sigterm' timed out. Killing.
systemd[1]: multipathd.service: Killing process 180272 (multipathd) with 
signal SIGKILL.
systemd[1]: multipathd.service: Processes still around after SIGKILL. 
Ignoring.
dbus-daemon[1920]: [system] Activating via systemd: service 
name='net.reactivated.Fprint' unit='fprintd.service' requested by 
':1.255' (uid=0 pid=95173 comm="/bin/login -p --      ")
systemd[1]: Starting Fingerprint Authentication Daemon...
dbus-daemon[1920]: [system] Successfully activated service 
'net.reactivated.Fprint'
systemd[1]: Started Fingerprint Authentication Daemon.
systemd-logind[2032]: New session 6 of user root.
systemd[1]: Started Session 6 of user root.
kernel: INFO: task multipathd:180274 blocked for more than 122 seconds.
kernel:      Not tainted 5.14.0-rc7-next-20210827-autotest #1
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
message.
kernel: task:multipathd      state:D stack:    0 pid:180274 ppid:     1 
flags:0x00040082
kernel: Call Trace:
kernel: [c00000002aaa72c0] [c00000002aaa73a0] 0xc00000002aaa73a0 
(unreliable)
kernel: [c00000002aaa74b0] [c00000000001e638] __switch_to+0x278/0x490
kernel: [c00000002aaa7510] [c000000000c89cfc] __schedule+0x31c/0xa10
kernel: [c00000002aaa75d0] [c000000000c8a468] schedule+0x78/0x130
kernel: [c00000002aaa7600] [c000000000c8aa08] 
schedule_preempt_disabled+0x18/0x30
kernel: [c00000002aaa7620] [c000000000c8cf0c] 
__mutex_lock.isra.11+0x36c/0x700
kernel: [c00000002aaa76b0] [c00000000067efe4] bd_link_disk_holder+0x34/0x270
kernel: [c00000002aaa7700] [c0080000003e3b78] 
dm_get_table_device+0x1e0/0x2c0 [dm_mod]
kernel: [c00000002aaa77a0] [c0080000003e7e48] dm_get_device+0x130/0x2f0 
[dm_mod]
kernel: [c00000002aaa7850] [c008000000745234] multipath_ctr+0x9bc/0xff0 
[dm_multipath]
kernel: [c00000002aaa79d0] [c0080000003e883c] 
dm_table_add_target+0x1a4/0x420 [dm_mod]
kernel: [c00000002aaa7a90] [c0080000003ee874] table_load+0x15c/0x4a0 
[dm_mod]
kernel: [c00000002aaa7b40] [c0080000003f1454] ctl_ioctl+0x27c/0x770 [dm_mod]
kernel: [c00000002aaa7d40] [c0080000003f1960] dm_ctl_ioctl+0x18/0x30 
[dm_mod]
kernel: [c00000002aaa7d60] [c000000000481198] sys_ioctl+0xf8/0x150
kernel: [c00000002aaa7db0] [c00000000002ff28] 
system_call_exception+0x158/0x2c0
kernel: [c00000002aaa7e10] [c00000000000c764] system_call_common+0xf4/0x258
kernel: --- interrupt: c00 at 0x7fffa06f4480
kernel: NIP:  00007fffa06f4480 LR: 00007fffa0ad6714 CTR: 0000000000000000
kernel: REGS: c00000002aaa7e80 TRAP: 0c00   Not tainted 
(5.14.0-rc7-next-20210827-autotest)
kernel: MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 24042204  
XER: 00000000
kernel: IRQMASK: 0 #012GPR00: 0000000000000036 00007fff9fd4c3a0 
00007fffa07e7100 0000000000000005 #012GPR04: 00000000c138fd09 
00007fff9806a0c0 00007fffa0ad9f18 00007fff9fd4a298 #012GPR08: 
0000000000000005 0000000000000000 0000000000000000 0000000000000000 
#012GPR12: 0000000000000000 00007fff9fd56300 00007fff9806a0c0 
00007fffa0ad9c80 #012GPR16: 00007fffa0ad9c80 00007fffa0ad9c80 
00007fffa0b13670 0000000000000000 #012GPR20: 00007fffa0ae3260 
00007fffa0b12040 00007fff9806a0f0 00007fff9800eca0 #012GPR24: 
00007fffa0ad9c80 00007fffa0ad9c80 00007fffa0ad9c80 0000000000000000 
#012GPR28: 00007fffa0ad9c80 00007fffa0ad9c80 0000000000000000 
00007fffa0ad9c80
kernel: NIP [00007fffa06f4480] 0x7fffa06f4480
kernel: LR [00007fffa0ad6714] 0x7fffa0ad6714
kernel: --- interrupt: c00
kernel: INFO: task systemd-udevd:180404 blocked for more than 122 seconds.
kernel:      Not tainted 5.14.0-rc7-next-20210827-autotest #1
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
message.
kernel: task:systemd-udevd   state:D stack:    0 pid:180404 ppid:  1156 
flags:0x00042482
kernel: Call Trace:

Before test
------------
$multipath -ll
mpathf (360050768108001b3a8000000000000e8) dm-10 IBM,2145
size=30G features='1 queue_if_no_path' hwhandler='1 alua' wp=rw
|-+- policy='round-robin 0' prio=50 status=active
| |- 1:0:0:4 sde 8:64  active ready running
| `- 2:0:0:4 sdq 65:0  active ready running
`-+- policy='round-robin 0' prio=10 status=enabled
   |- 1:0:1:4 sdj 8:144 active ready running
   `- 2:0:1:4 sdv 65:80 active ready running
$

After test fail
------------
$ multipath -ll
mpathf (360050768108001b3a8000000000000e8) dm-10 ##,##
size=30G features='1 queue_if_no_path' hwhandler='0' wp=rw
$

-- 
Regard's

Abdul Haleem
IBM Linux Technology Center

